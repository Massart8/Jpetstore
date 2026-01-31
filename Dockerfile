#
#    Copyright 2010-2023 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       https://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#


# Utilisation de l'image de base Java 17 
FROM openjdk:17.0.2

# Passage temporaire en ROOT pour installer les dépendances système nécessaires
USER root

# INSTALLATION DES OUTILS DE TEST (Répare l'erreur SessionNotCreatedException)
# - chromium : le navigateur qui exécutera les tests d'interface
# - chromium-driver : permet à Selenium de piloter Chromium
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Définition du répertoire de travail 
WORKDIR /usr/src/myapp

# SÉCURITÉ : Création de l'utilisateur non-privilégié et attribution des droits
RUN useradd -m jpetuser && chown -R jpetuser:jpetuser /usr/src/myapp

# CONTINUITÉ : Copie de tous les fichiers du projet avec les permissions pour jpetuser
# Cela inclut le dossier .mvn/ corrigé précédemment
COPY --chown=jpetuser:jpetuser . .

# Droits d'exécution sur le script Maven Wrapper
RUN chmod +x mvnw

# CONFIGURATION SELENIUM (INDISPENSABLE POUR GITHUB ACTIONS)
# Ces variables forcent les tests à s'exécuter sans fenêtre graphique (mode headless)
ENV SELENIDE_BROWSER=chrome
ENV SELENIDE_HEADLESS=true
ENV CHROME_BIN=/usr/bin/chromium

# Retour à l'utilisateur sécurisé pour la phase de build et d'exécution
USER jpetuser

# Compilation du projet
# On garde -DskipTests ici pour la construction de l'image initiale
RUN ./mvnw clean package -DskipTests

# Commande de lancement de l'application 
CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]