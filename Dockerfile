FROM python:3.7-slim

WORKDIR /app # replace on your own


# add environment variables if you want
ENV GOOGLE_APPLICATION_CREDENTIALS ./credentials/google-credential.json

RUN set -x \
  && apt-get update -yqq \
  && apt-get upgrade -yqq \
  && apt-get install -yqq --no-install-recommends \
    git \
    curl \
    build-essential \
    python-dev \
    apt-utils \
    libsndfile-dev \
    gcc \
    cmake \
    libyaml-dev

COPY ./ ./

RUN python3 -m venv venv \
  && . venv/bin/activate \
  && python3 setup.py install \
  && rm -rf /var/lib/apt/lists/*


CMD ["/bin/bash", "-c", "echo 'python container"]
