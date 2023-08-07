FROM --platform=linux/amd64 python:3.9-slim-buster as python

# Metadata
LABEL name="PBG Website"
LABEL maintainer="PBG"
LABEL version="0.1"

ARG YOUR_ENV="virtualenv"
ARG POETRY_VERSION="1.5.1"

ENV YOUR_ENV=${YOUR_ENV} \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME=/opt/poetry \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_NO_INTERACTION=1 \
    POETRY_VERSION=${POETRY_VERSION} \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

ENV PATH="$POETRY_HOME/bin:$PATH"

# add ssh config capabilities
# RUN mkdir -p ~/.ssh
# COPY bin/ssh-config.sh /usr/bin
# RUN chmod +x /usr/bin/ssh-config.sh

# Install libraries
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    libpq-dev gcc wget gnupg2 curl openssh-client git make build-essential \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    pngquant optipng
# # add custom host file for your services
# COPY hosts tmp/
# ADD hosts /tmp/hosts
# # Warning: if you test on M1 and arch64 architecture you could have an issue with this line
# RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
# # If you are using mac or arch64 change X86_64-linux-gnu with aarch64-linux-gnu
# RUN perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
# ENV LD_LIBRARY_PATH /lib-override

RUN  wget -O install-poetry.py https://install.python-poetry.org/ \
    && python install-poetry.py --version ${POETRY_VERSION}

# Project Python definition
WORKDIR /app

#Copy all the project files
COPY pyproject.toml .
COPY poetry.lock .
COPY poetry.toml .

RUN poetry install --no-interaction --no-ansi --only main && \
    rm -rf /root/.cache/pypoetry
RUN poetry cache clear --all pypi

COPY docs ./docs
COPY notebooks ./notebooks
COPY mkdocs.txt .
COPY Makefile .
COPY mkdocs.yml .

#Launch the main (if required)
# CMD ["make debug_docker"]
# Start development server by default
# ENTRYPOINT ["mkdocs"]
# CMD ["make", "docs_launch_docker"]

#keep the container running in background
# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]

RUN make docs_build

FROM nginx as deploy

COPY --from=python /mkdocs/site /usr/share/nginx/html

# Copy the nginx config to nginx config directly
COPY nginx.conf /etc/nginx/conf.d