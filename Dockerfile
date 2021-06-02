##FROM python:3.6.5-slim
FROM python:3.10.0b1-alpine3.13

RUN apk add git && \
    cd /root && \
    git clone https://github.com/pmaji/crypto-whale-watching-app.git && \
    cd crypto-whale-watching-app && \
    pip install -r requirements.txt

EXPOSE 8050

# set new working dir to 
WORKDIR /root/crypto-whale-watching-app

# run the application:
CMD ["python", "app.py"]
