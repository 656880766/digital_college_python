# Utiliser une image Python légère comme base
FROM python:3.10-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier requirements.txt pour installer les dépendances
COPY . .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port Flask
EXPOSE 5000

# Utiliser le script d'entrée pour gérer les migrations et démarrer le serveur
ENTRYPOINT ["./entrypoint.sh"]

# Commande par défaut pour lancer l'application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
