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


# Image de base Java 17 (Oracle Linux, sécurisée et légère)
FROM openjdk:17.0.2

# Dossier où l'application sera stockée dans le conteneur
WORKDIR /usr/src/myapp

# SÉCURITÉ : Création d'un utilisateur sans privilèges (jpetuser)
# On lui donne la propriété du dossier pour éviter de rouler en ROOT
RUN useradd -m jpetuser && chown -R jpetuser:jpetuser /usr/src/myapp

# CONTINUITÉ : Copie de tout le projet dans le conteneur
# On s'assure que les droits appartiennent à jpetuser
COPY --chown=jpetuser:jpetuser . .

# On rend le script Maven exécutable
RUN chmod +x mvnw

# On bascule sur l'utilisateur sécurisé
USER jpetuser

# COMPILATION : On pré-construit l'application
# -DskipTests : On ne lance pas les tests ici car il n'y a pas d'écran/navigateur
RUN ./mvnw clean package -DskipTests

# Commande par défaut pour lancer le serveur Tomcat au démarrage
CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]