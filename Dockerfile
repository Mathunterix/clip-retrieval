# Utilise une image Python propre
FROM python:3.10-slim

# Installe les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Clone le code (facultatif si tu es déjà dans un repo avec le code)
WORKDIR /app
COPY . /app

# Installe les dépendances Python
RUN pip install --upgrade pip && pip install .

# Expose l’API HTTP
EXPOSE 8080

# Lance le serveur avec API activée
CMD ["clip-retrieval", "--enable-api", "--clip-model", "ViT-B-32", "--enable-remote-code"]
