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


# Utilisation de l'image de base 
FROM openjdk:17.0.2

# Passage en ROOT pour installer les outils
USER root

# INSTALLATION DES OUTILS DE TEST (Version Alpine Linux)
# - apk update : met à jour la liste des paquets
# - chromium & chromium-chromedriver : noms des paquets sur Alpine
RUN apk update && apk add --no-cache \
    chromium \
    chromium-chromedriver \
    udev \
    ttf-freefont

# Définition du répertoire de travail
WORKDIR /usr/src/myapp

# SÉCURITÉ : Utilisateur non-privilégié
RUN adduser -D docker-user && chown -R docker-user:docker-user /usr/src/myapp

# CONTINUITÉ : Copie des fichiers
COPY --chown=docker-user:docker-user . .

# Droits d'exécution
RUN chmod +x mvnw

# CONFIGURATION SELENIUM (INDISPENSABLE)
ENV SELENIDE_BROWSER=chrome
ENV SELENIDE_HEADLESS=true
# Sur Alpine, le chemin du driver est spécifique
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

USER docker-user

# Compilation
RUN ./mvnw clean package -DskipTests

CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]