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


# Image de base Java 17 (Oracle Linux), choisie pour sa sécurité
FROM openjdk:17.0.2

# Dossier de travail dans le conteneur
WORKDIR /usr/src/myapp

# SÉCURITÉ : Création d'un utilisateur non-root pour l'exécution
# Cela limite les risques si l'application est compromise
RUN useradd -m jpetuser && chown -R jpetuser:jpetuser /usr/src/myapp

# Copie des fichiers sources avec les bonnes permissions
COPY --chown=jpetuser:jpetuser . .

# On rend le Maven Wrapper exécutable pour le build
RUN chmod +x mvnw

# Passage à l'utilisateur sécurisé
USER jpetuser

# Compilation de l'application (JAR/WAR)
# On ignore les tests ici car ils seront gérés par le workflow GitHub
RUN ./mvnw clean package -DskipTests

# Commande pour démarrer l'application avec Tomcat
CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]