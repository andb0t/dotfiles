# Following microsoft blog-post: https://blogs.msdn.microsoft.com/commandline/2017/12/08/cross-post-wsl-interoperability-with-docker/
# install go

go get -d github.com/jstarks/npiperelay
mkdir -p /mnt/c/Users/$WIN_USER/go/bin
cd ~/go/src
GOOS=windows go build -o "/mnt/c/Users/$WIN_USER/go/bin/npiperelay.exe" github.com/jstarks/npiperelay
sudo ln -s /mnt/c/Users/$WIN_USER/go/bin/npiperelay.exe /usr/local/bin/npiperelay.exe
sudo apt install socat
sudo apt install docker.io

# Add WSL user to docker group
sudo adduser $USER docker

echo "Finished installation! Run `init_docker` to initiate it"
