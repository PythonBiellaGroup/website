FROM ghcr.io/pythonbiellagroup/dockbase/python-base:0.0.3 as python

# Metadata
LABEL name="PBG Website"
LABEL maintainer="PBG"
LABEL version="0.1"

# Project Python definition
WORKDIR /app

#Copy all the project files
COPY pyproject.toml .
COPY poetry.lock .
COPY poetry.toml .

# You need to create a .env file in your project to download the private package from github
# With GHCR_USERNAME and GHCR_TOKEN
# By default the Docker shell it's sh and not bash
# This is not very secure, but it's only for internal testing, not for release
# COPY .env .
# RUN . /app/.env && poetry config http-basic.mkdocs ${GHCR_USERNAME} ${GHCR_TOKEN} && \
#     poetry install --no-interaction --no-ansi --only main && \
#     rm -rf /root/.cache/pypoetry
RUN poetry install --no-interaction --no-ansi --only main && \
    rm -rf /root/.cache/pypoetry
RUN poetry cache clear --all pypi

COPY docs ./docs
COPY theme ./theme
# COPY notebooks ./notebooks
COPY Makefile .
COPY mkdocs.yml .
# COPY mkdocs.insiders.yml .

RUN make docs_build

FROM nginx as deploy

COPY --from=python /app/site /usr/share/nginx/html

# Copy the nginx config to nginx config directly
COPY nginx.conf /etc/nginx/conf.d