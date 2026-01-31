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
# Utilisation de l'image de base (Oracle Linux)
FROM openjdk:17.0.2

# Passage en ROOT pour installer les outils
USER root

# INSTALLATION DES OUTILS DE TEST (Version microdnf)
# microdnf install : équivalent léger de yum/dnf
# - chromium : le navigateur
# - chromedriver : le driver pour Selenium
RUN microdnf update -y && microdnf install -y \
    chromium \
    chromedriver \
    && microdnf clean all

# Définition du répertoire de travail
WORKDIR /usr/src/myapp

# SÉCURITÉ : Création de l'utilisateur non-privilégié
# Sur Oracle Linux, on utilise 'useradd'
RUN useradd -m jpetuser && chown -R jpetuser:jpetuser /usr/src/myapp

# CONTINUITÉ : Copie des fichiers
COPY --chown=jpetuser:jpetuser . .

# Droits d'exécution sur le script Maven
RUN chmod +x mvnw

# CONFIGURATION SELENIUM HEADLESS
ENV SELENIDE_BROWSER=chrome
ENV SELENIDE_HEADLESS=true
# Chemins par défaut pour Oracle Linux
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

USER jpetuser

# Compilation
RUN ./mvnw clean package -DskipTests

CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]