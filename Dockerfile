# pull official base image
FROM python:alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apk update && \
    apk upgrade 
    #install -y --no-install-recommends gcc
RUN apk add python3
RUN apk add py3-pip
# RUN python -m venv .venv
# RUN source .venv/bin/activate
RUN pip3 install -r requirements.txt

EXPOSE 80

CMD ["python3", "app.py"]



# # lint
# RUN pip install --upgrade pip
# RUN pip install flake8==6.0.0
# COPY . /usr/src/app/
# RUN flake8 --ignore=E501,F401 .

# # install python dependencies
# COPY ./requirements.txt .
# RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements.txt


# #########
# # FINAL #
# #########

# # pull official base image
# FROM python:3.11.3-slim-buster

# # create directory for the app user
# RUN mkdir -p /home/app

# # create the app user
# RUN addgroup --system app && adduser --system --group app

# # create the appropriate directories
# ENV HOME=/home/app
# ENV APP_HOME=/home/app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME

# # install dependencies
# RUN apt-get update && apt-get install -y --no-install-recommends netcat
# COPY --from=builder /usr/src/app/wheels /wheels
# COPY --from=builder /usr/src/app/requirements.txt .
# RUN pip install --upgrade pip
# RUN pip install --no-cache /wheels/*

# # copy entrypoint-prod.sh
# COPY ./entrypoint.prod.sh $APP_HOME

# # copy project
# COPY . $APP_HOME

# # chown all the files to the app user
# RUN chown -R app:app $APP_HOME

# # change to the app user
# USER app

# # run entrypoint.prod.sh
# ENTRYPOINT ["/home/app/entrypoint.sh"]