FROM --platform=linux/amd64 python:3.10.12-slim-buster as python

# Metadata
LABEL name="Mkdocs website"
LABEL maintainer="PBG"
LABEL version="0.1"

ARG YOUR_ENV="virtualenv"
ARG POETRY_VERSION="1.7.1"

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

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    wget curl libpq-dev gcc wget gnupg2 curl openssh-client make git build-essential

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
COPY myapp ./myapp
COPY Makefile .
COPY mkdocs.yml .

#Launch the main (if required)
# CMD ["make debug_docker"]
CMD ["make", "launch_docker"]

#keep the container running in background
# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]