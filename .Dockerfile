# Use uma versão mais recente do Debian ou Ubuntu
FROM debian:bookworm-slim

# Instalar o OpenJDK 17
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Definir JAVA_HOME e configurar o caminho de trabalho
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
WORKDIR /app

# Copiar o código do bot
COPY . .

# Executar o bot
CMD ["java", "-jar", "SeuBot.jar"]
