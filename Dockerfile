FROM python:3.12-slim
WORKDIR /app
COPY app/ /app/
RUN python --version && mkdir -p /app/data
ENV PYTHONUNBUFFERED=1
EXPOSE 5000
CMD ["python", "app.py"]
