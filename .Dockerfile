# Use a imagem base Python 3.10 slim
FROM python:3.10-slim

# Adicione o OpenJDK 11 para rodar o LavaLink
COPY --from=openjdk:11-jdk-slim /usr/local/openjdk-11 /usr/local/openjdk-11

# Configurar a variável JAVA_HOME
ENV JAVA_HOME /usr/local/openjdk-11
RUN update-alternatives --install /usr/bin/java java /usr/local/openjdk-11/bin/java 1

# Defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie os arquivos do projeto
COPY . .

# Instale as dependências do sistema e do Python
RUN apt-get update \
    && apt-get install -y gcc git libc6 libstdc++6 \
    && apt-get clean

# Instale as dependências do Python listadas em requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Exponha as portas necessárias
EXPOSE 8080 2333

# Comando para iniciar o bot Python e o LavaLink
CMD ["python", "/usr/src/app/main.py"]
