FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
SHELL ["/bin/bash", "-c"]
COPY . /code/
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY ./scripts/entrypoint /entrypoint
RUN chmod +x /entrypoint

COPY ./scripts/start /start-django
RUN chmod +x /start-django