FROM python:3-slim

WORKDIR /app

EXPOSE 8443

CMD ["python3", "-m", "http.server", "8443"] 
