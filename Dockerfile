FROM python:3.8-buster

RUN apt-get update && \
    apt-get -y install python3-pandas

WORKDIR /app

COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

CMD ["python3", "/app/src/api.py"]