echo "Clonando repositorio..."
sudo git clone https://github.com/abelantunes98/AntiDdos-CentOS
cd AntiDdos-CentOS

echo "Baixando dependencias."
sudo yum install httpd-devel
sudo yum groupinstall 'Development tools'

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
sudo mv httpd.conf /etc/httpd/conf/

echo "execute sudo nano /etc/httpd/conf/httpd.conf e mude o email por um seu."
