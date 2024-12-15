#!/bin/bash

# Vérifier si le répertoire "migrations" est vide
if [ ! -d "./migrations" ] || [ -z "$(ls -A ./migrations)" ]; then
    echo "Initialisation des migrations..."
    flask db init
    flask db migrate -m "Initial migration"
    flask db upgrade
else
    echo "Mise à jour des migrations..."
    flask db migrate
    flask db upgrade
fi

# Lancer l'application Flask
exec "$@"
