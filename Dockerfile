# ---------- Dockerfile pour clip-retrieval (embedding-only) ----------
# 1. Image de base légère Python 3.10
FROM python:3.10-slim

# 2. Dépendances système minimales
RUN apt-get update && apt-get install -y \
        git \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# 3. Copier le code du repo forké dans le conteneur
WORKDIR /app
COPY . /app

# 4. Installer clip-retrieval + dépendances Python
RUN pip install --upgrade pip && pip install .

# 5. Exposer l'API sur 8010
EXPOSE 8010

# 6. Lancer le backend d'inférence (texte & image) sur 8010
CMD ["clip-retrieval", "inference", "--port", "8010", "--clip-model", "ViT-B-32"]
# ---------------------------------------------------------------------
