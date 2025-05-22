# Utilise une image Python propre
FROM python:3.10-slim

# Installe les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Crée un dossier de travail
WORKDIR /app
COPY . /app

# Installe les dépendances Python du projet
RUN pip install --upgrade pip && pip install .

# Expose l’API HTTP
EXPOSE 8010

# Démarre l'API d'embedding
CMD ["clip-retrieval", "inference", "--port", "8010", "--clip-model", "ViT-B-32"]
