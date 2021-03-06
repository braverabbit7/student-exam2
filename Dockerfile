FROM alpine:latest
MAINTAINER Adaykin Semen
#Обновление пакетов; Установка программ
RUN apk update
RUN apk upgrade
##layer 1: `python`
RUN apk add python3 && \
apk add py-pip
##layer 2: `copy app`
COPY . /student
WORKDIR /student
##layer 3 (install pip)
RUN pip install -e .
#apk add curl
#chmod +x ruapp
##layer 4 (run app)
EXPOSE 5000
ENTRYPOINT export FLASK_APP=js_example && flask run --host=0.0.0.0
