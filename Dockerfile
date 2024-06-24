FROM python:3.8-slim

RUN mkdir /app

WORKDIR /app

EXPOSE 5000:5000

COPY ./requirements.txt /tmp/requirements.txt

## Pip dependencies
# Upgrade pip
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

COPY . .

# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "/app.run.py:app"]
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]