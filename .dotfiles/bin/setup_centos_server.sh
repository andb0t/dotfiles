echo "Setting up new centos server ..."


SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/$(basename $0)"


echo "Check if nameservers present"
FILE="/etc/resolv.conf"
if [ ! -f $FILE ]; then
    echo "# This file was created by custom setup script $SCRIPT" > "$FILE"
fi
CONTENT=$(grep "^[^#]" $FILE)
if [ -z "$CONTENT" ]; then
    NAMESERVER="nameserver 8.8.8.8"
    echo "Adding $NAMESERVER to $FILE"
    echo $NAMESERVER >> $FILE
else
    echo "$CONTENT"
fi


echo "Update yum"
yum update -y
yum upgrade -y


echo "Install utility programs"
yum install -y vim
yum install -y tmux
yum install -y git

echo "Install python"
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum update -y
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip
sudo pip3.6 install --upgrade pip
sudo pip3.6 install pipenv

echo "What you should probably do by hand:"
echo "    adduser YOUR_NEW_USER"
echo "    passwd YOUR_NEW_USER"
echo "    gpasswd -a YOUR_NEW_USER wheel"
echo "    sudo usermod -aG docker \$(whoami)"
echo "    gpasswd -a YOUR_NEW_USER wheel"

