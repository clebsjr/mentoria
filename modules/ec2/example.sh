#!/bin/bash

set -xe

apt update -y

# Verifica se o diretório /etc/apt/keyrings existe, se não, cria
mkdir -p /etc/apt/keyrings

# Verifica se a chave GPG do Docker já existe
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
  echo "Baixando a chave GPG do Docker..."
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
else
  echo "A chave GPG do Docker já existe."
fi

# Adiciona o repositório Docker ao APT
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update -y

# Instala o Docker (é recomendável instalar o docker-ce, docker-ce-cli e containerd.io explicitamente)
apt install -y docker-ce docker-ce-cli containerd.io

cat <<EOF > index.html
<html>
  <body style="background-color: pink; text-align: center;">
    <h1>Instância $(hostname)</h1>
  </body>
</html>
EOF

docker run -d -p 80:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html nginx

echo "Docker instalado com sucesso. Por favor, faça logout e login novamente para aplicar as permissões."