FROM python:3.10.17-slim

RUN apt update
RUN apt-get install -y ffmpeg
RUN apt install python3-pip -y

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN python -m playwright install
RUN python -m playwright install-deps

CMD ["python3", "main.py"]
