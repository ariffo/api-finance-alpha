#FROM alpine:3.14

#RUN apk add --no-cache --update python3  \
#    && apk add --update py3-pip && pip install --upgrade pip setuptools

#&& pip install pandas-1.3.1

# RUN apk add libxml2-dev libxslt-dev

FROM python:3.8-buster

RUN apt-get update && \
    apt-get -y install python3-pandas


WORKDIR /app

COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

CMD ["python3", "/app/src/api.py"]