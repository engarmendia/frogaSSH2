# Usamos de imagen base la última versión de ubuntu
FROM ubuntu:latest

# Instalar ProFTPD y otras dependencias
RUN apt update && \
    apt install -y proftpd && \
    apt install -y nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia el archivo de configuración personalizado al contenedor
COPY proftpd.conf /etc/proftpd/proftpd.conf

# Copiar los recursos al contenedor
COPY Recursos_Contenedor_1 /srv/ftp

# Exponer los puertos
EXPOSE 21 50000-50030

# Iniciar el servicio ProFTPD
CMD ["/usr/sbin/proftpd", "--nodaemon"]

#commit froga