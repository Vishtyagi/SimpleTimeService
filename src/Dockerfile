FROM python:3.13.3-slim-bookworm AS builder

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100

RUN apt-get update && apt-get install -y build-essential gcc libffi-dev libssl-dev && \
rm -rf /var/lib/apt/lists/*  

RUN python -m pip install --upgrade pip wheel

COPY requirements.txt .

RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip wheel && \
    /opt/venv/bin/pip wheel --wheel-dir=/wheels -r requirements.txt && \
    /opt/venv/bin/pip install --no-index --find-links=/wheels -r requirements.txt

RUN rm requirements.txt

FROM python:3.13.3-slim-bookworm AS final 

WORKDIR /app

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN set -ex \
    && addgroup --system --gid 1001 appgroup \
    && adduser --system --uid 1001 --gid 1001 --no-create-home appuser \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

COPY SimpleTimeService.py .

EXPOSE 5000

USER appuser

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "SimpleTimeService:app"]

