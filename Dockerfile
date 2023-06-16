from alpine:latest
workdir /app
COPY . /app

RUN apk update && apk upgrade
RUN apk add python3
RUN apk add py3-pip
RUN python -m venv .venv
RUN source .venv/bin/activate
RUN pip install -r requirements.txt

CMD ["python", "app.py"]

expose 80