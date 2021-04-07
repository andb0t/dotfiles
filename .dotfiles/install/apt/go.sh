# either use snap:
sudo snap install --classic go

# or download directly
#Download Go. You should change the version if there's a newer one. Check at: https://golang.org/dl/
sudo wget https://storage.googleapis.com/golang/go1.11.3.linux-amd64.tar.gz
#unzip Go
sudo tar -C /usr/local -xzf go1.11.3.linux-amd64.tar.gz
rm -f go1.11.3.linux-amd64.tar.gz

# finaly create go folder and set GOPATH and PATH accordingly
mkdir "$HOME/go"
