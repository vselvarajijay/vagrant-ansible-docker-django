FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install Django
RUN django-admin startproject djangodocker
EXPOSE 8000
WORKDIR /djangodocker
CMD python manage.py runserver 0.0.0.0:8000
