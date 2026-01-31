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


FROM openjdk:17.0.2

# Création du dossier de travail
WORKDIR /usr/src/myapp

# SÉCURITÉ : Création d'un utilisateur sans mot de passe
# On utilise une méthode plus universelle pour créer l'utilisateur
RUN useradd -u 1001 jpetuser && \
    chown -R jpetuser:jpetuser /usr/src/myapp

# CORRECTION BUILD : Copie explicite
COPY --chown=jpetuser:jpetuser .mvn/ .mvn/
COPY --chown=jpetuser:jpetuser mvnw mvnw
COPY --chown=jpetuser:jpetuser pom.xml pom.xml
COPY --chown=jpetuser:jpetuser src/ src/

# SÉCURITÉ : On passe à l'utilisateur non-root
USER jpetuser

# Compilation
RUN ./mvnw clean package

CMD ./mvnw cargo:run -P tomcat90