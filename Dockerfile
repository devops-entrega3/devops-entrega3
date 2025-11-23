FROM 632489960146.dkr.ecr.us-east-1.amazonaws.com/python-base:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

COPY newrelic.ini newrelic.ini

ENV NEW_RELIC_CONFIG_FILE=newrelic.ini

CMD ["newrelic-admin", "run-program", "python", "application.py"]