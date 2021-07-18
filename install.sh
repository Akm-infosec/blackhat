npm install broken-link-checker -g
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
apt install whois
apt install python-pip
apt install python3-pip
pip install scapy
wget -O master.zip https://github.com/secdev/scapy/archive/master.zip
unzip master.zip
cd master
cd scapy
python setup.py install
git pull
python setup.py install
go get github.com/haccer/subjack
go get github.com/tomnomnom/hacks/waybackurls
git clone https://github.com/Tuhinshubhra/CMSeeK
cd CMSeeK
pip3 install -r requirements.txt
