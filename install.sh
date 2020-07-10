apt-get update
apt-get upgrade -y

apt-get install nodejs
apt-get install npm
npm install -g --unsafe-perm node-red node-red-admin
npm install -g pm2
pm2 start /usr/local/bin/node-red -- -v
pm2 startup
pm2 save
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.8.0_amd64.deb
dpkg -i influxdb_1.8.0_amd64.deb
systemctl enable influxdb
systemctl start influxdb

wget https://dl.influxdata.com/telegraf/releases/telegraf_1.14.5-1_amd64.deb
dpkg -i telegraf_1.14.5-1_amd64.deb
systemctl enable telegraf
systemctl start telegraf

apt-get install -y gnupg2 curl  software-properties-common
curl https://packages.grafana.com/gpg.key | sudo apt-key add -
add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
apt-get update
apt install grafana
systemctl enable grafana-server
systemctl start grafana-server
