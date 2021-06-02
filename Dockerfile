##FROM python:3.6.5-slim
FROM python:3.10.0b1-alpine3.13

# setup virtual env vars
ENV VIRTUAL_ENV=/opt/crypto_app


# create python virtual env
## RUN python3 -m venv $VIRTUAL_ENV

# update/upgrade and install git
## RUN apt-get update && \
##    apt-get upgrade -y && \
##    apt-get install -y \
##    git-all 

RUN apk add git && \
    cd $VIRTUAL_ENV && \
    git clone https://github.com/pmaji/crypto-whale-watching-app.git && \
    cd crypto-whale-watching-app && \
    pip install -r requirements.txt

EXPOSE 8050

# set new working dir to 
WORKDIR ${VIRTUAL_ENV}/crypto-whale-watching-app

# run the application:
CMD ["python", "app.py"]
