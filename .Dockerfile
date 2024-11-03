# Use uma imagem baseada no Ubuntu 22.04
FROM ubuntu:22.04

# Instale Python, Java e dependências
RUN apt-get update && \
    apt-get install -y python3.10 python3-pip openjdk-11-jdk curl && \
    apt-get clean

# Defina o JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java

# Defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie os arquivos do projeto
COPY . .

# Instale dependências do Python
RUN pip3 install --no-cache-dir -r requirements.txt

# Exponha as portas necessárias
EXPOSE 8080 2333

# Copiar e dar permissão de execução para o script de inicialização
COPY start.sh /usr/src/app/start.sh
RUN chmod +x /usr/src/app/start.sh

# Comando para iniciar o bot e o LavaLink
CMD ["/usr/src/app/start.sh"]

