FROM python:3.9.5-slim
LABEL maintainer='sazz'

ENV PYTHONUNBUFFERED 1


COPY ./app /app
COPY ./run.sh app/run.sh
COPY ./requirements.txt /requirements.txt

EXPOSE 8000

RUN apt-get update -yqq && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends \
    wget \
    libczmq-dev \
    curl \
    libssl-dev \
    git \
    inetutils-telnet \
    bind9utils freetds-dev \
    libkrb5-dev \
    libsasl2-dev \
    libpq-dev \
    freetds-bin build-essential \
    default-libmysqlclient-dev \
    apt-utils \
    rsync \
    zip \
    unzip \
    gcc \
    vim \
    locales \
    && apt-get clean

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN chmod +x ./app/run.sh
WORKDIR /app

ENTRYPOINT ["sh","run.sh"]




