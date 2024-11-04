FROM debian:bookworm-slim  # Debian mais recente

# Instale o OpenJDK 17
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Configure o JAVA_HOME e instale outras dependências
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
WORKDIR /app

# Copiar o código do bot
COPY . .

# Comando para iniciar o bot
CMD ["java", "-jar", "SeuBot.jar"]
