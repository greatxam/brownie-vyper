# Dockerfile to build Brownie Vyper

# Use an official Python 3 runtime as our base image
FROM debian:buster

MAINTAINER greatxam

RUN apt-get update && \
	apt-get upgrade -y

RUN apt-get install -y \
    build-essential \
    python3.7 \
    python3-pip

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

# Install any needed packages specified in our `requirements.txt`
RUN pip3 install -r requirements.txt

WORKDIR /brownie-vyper

COPY ./src/brownie-vyper /brownie-vyper
