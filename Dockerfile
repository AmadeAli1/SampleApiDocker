FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN cd ./src && ls
RUN pwd && ls
#RUN ./mvnw dependency:resolve
#CMD ["./mvnw", "spring-boot:run"]