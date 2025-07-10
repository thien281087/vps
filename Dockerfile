FROM python:3.12-slim

# Cài công c? c?n thi?t
RUN apt-get update && apt-get install -y \
    git curl wget nano python3 python3-pip python-is-python3 \
    && apt-get clean

# Copy requirements tru?c d? t?n d?ng cache
COPY requirements.txt /app/
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt



RUN pip install attrs

# ? Copy toàn b? mã dã mã hóa (bao g?m pyarmor_runtime_000000/)
COPY dist/ /app/

# Copy .env n?u có
#COPY .env /app/

# M? port
EXPOSE 5117

# ? Ð?m b?o dúng tên file, ví d?: app.py ? app:app
#CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "5117"]

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5117"]

