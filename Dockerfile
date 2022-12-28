#
# Build stage
#
FROM amazoncorretto:17 AS build
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw
RUN ./mvnw clean package
RUN ./mvnw install

#
# Package stage
#
FROM amazoncorretto:17-alpine
COPY --from=build /app/build/libs/SampleApi-0.0.1.jar /usr/local/lib/spring-render-deploy.jar
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","-Dfile.encoding=UTF-8","/usr/local/lib/spring-render-deploy.jar"]
