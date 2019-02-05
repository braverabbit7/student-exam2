FROM alpine:latest
MAINTAINER Adaykin Semen
#Обновление пакетов; Установка программ
RUN apk update && apk upgrade
#layer 1: `Установка программ`
RUN apk add openssh \
&& apk add openrc \
&& apk add openjdk8 \
&& apk add ansible \
&& apk add python3 \
&& apk add git \
&& apk add docker \
&& apk add bash
#layer 2: `Запуск ssh-сервера`
RUN /usr/bin/ssh-keygen -A
CMD /usr/sbin/sshd -D
#layer 3 `Создание пользователя; Копирование предварительно сгенерированных ssh ключей`
RUN adduser -D Jenkins \
&& echo Jenkins:123 | chpasswd
COPY ./keys /home/Jenkins/keys/
#layer 4 `Права на дирректории + установка ssh ключа`
RUN mkdir /home/Jenkins/.\ssh \
&& touch /home/Jenkins/.\ssh/authorized_keys \
&& chown -R Jenkins /home/Jenkins/.\ssh \
&& cat /home/Jenkins/keys/id_rsa.pub > /home/Jenkins/.\ssh/authorized_keys
