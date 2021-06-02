FROM python:3.6.5-slim

# setup virtual env vars
ENV VIRTUAL_ENV=/opt/crypto_app


# set path
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# make active dir for git install
WORKDIR $VIRTUAL_ENV

# create python virtual env
RUN python3 -m venv $VIRTUAL_ENV


# update/upgrade and install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    git-all 

# clone pmaji/crypto-whale-watching-app repo
RUN git clone https://github.com/pmaji/crypto-whale-watching-app.git

# install dependencies:
RUN pip install -r requirements.txt

EXPORT 8050

# set new working dir to 
WORKDIR ${VIRTUAL_ENV}/crypto-whale-watching-app

# run the application:
CMD ["python", "app.py"]
