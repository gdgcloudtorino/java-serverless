FROM azul/zulu-openjdk:21-jdk-crac-latest
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY target/*.jar /app/app.jar


COPY src/scripts/entrypoint.sh /app/entrypoint.sh
RUN chmod 755 /app/entrypoint.sh
RUN /app/entrypoint.sh
ENTRYPOINT ["java", "-XX:CRaCRestoreFrom=/crac" ,"-jar","/app/app.jar" ]