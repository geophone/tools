FROM python:3.11
COPY myapk.apk myapk.apk
RUN apt-get update
RUN apt-get install -y default-jre wget
RUN wget https://github.com/skylot/jadx/releases/download/v1.5.1/jadx-1.5.1.zip
RUN unzip *.zip
RUN pip install apkscan
CMD ["apkscan", "myapk.apk", "-o", "/output/secrets.json"]

