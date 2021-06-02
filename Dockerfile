##FROM python:3.6.5-slim
FROM python:3.8-alpine

RUN apk add git && \
    cd /root && \
    git clone https://github.com/pmaji/crypto-whale-watching-app.git

#ADD strip_requirements.txt crypto-whale-watching-app/

#RUN cd crypto-whale-watching-app && \
#    pip install -r strip_requirements.txt

RUN cd crypto-whale-watching-app && \
    pip install -r requirements.txt

EXPOSE 8050

# set new working dir to 
WORKDIR /root/crypto-whale-watching-app

# run the application:
CMD ["python", "app.py"]
