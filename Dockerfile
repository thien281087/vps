FROM python:3.12-slim

# C�i c�ng c? c?n thi?t
RUN apt-get update && apt-get install -y \
    git curl wget nano python3 python3-pip python-is-python3 \
    && apt-get clean

# Copy requirements tru?c d? t?n d?ng cache
COPY requirements.txt /app/
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt



RUN pip install attrs

# ? Copy to�n b? m� d� m� h�a (bao g?m pyarmor_runtime_000000/)
COPY dist/ /app/

# Copy .env n?u c�
#COPY .env /app/

# M? port
EXPOSE 5117

# ? �?m b?o d�ng t�n file, v� d?: app.py ? app:app
#CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "5117"]

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5117"]

