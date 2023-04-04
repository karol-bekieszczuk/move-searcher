FROM python:3.8-alpine

COPY /app/requirements.txt /app/requirements.txt

WORKDIR /app

RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

COPY ./app /app
EXPOSE 3000

CMD [ "python3", "app.py", "--debug" ]