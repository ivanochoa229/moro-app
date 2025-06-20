FROM eclipse-temurin:17-jre-jammy
ENV DATABASE_URL=${DATABASE_URL}
ENV DATABASE_USERNAME=${DATABASE_USERNAME}
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}

ARG JAR_FILE=/usr/app/target/*.jar
COPY --from=build $JAR_FILE /app/runner.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/runner.jar","--spring.datasource.url=${DATABASE_URL}","--spring.datasource.username=${DATABASE_USERNAME}","--spring.datasource.password=${DATABASE_PASSWORD}"]