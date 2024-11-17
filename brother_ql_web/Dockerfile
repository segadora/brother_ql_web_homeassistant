ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add git fontconfig ttf-dejavu

WORKDIR /brother_ql_web

RUN pip install git+https://github.com/FriedrichFroebel/brother_ql_web@master

EXPOSE 8013

COPY run.sh .
COPY config.example.json .

RUN chmod a+x run.sh

CMD [ "./run.sh" ]
