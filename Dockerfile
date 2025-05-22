FROM ghcr.io/rom1504/clip-retrieval:main

CMD ["clip-retrieval", "--enable-api", "--clip-model", "ViT-B-32", "--enable-remote-code"]
