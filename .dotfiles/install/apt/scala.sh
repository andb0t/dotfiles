# if ! type "scala" > /dev/null; then
#     sudo apt -y remove scala-library scala
#     wget https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.deb
#     sudo dpkg -i scala-2.11.8.deb
#     rm scala-2.12.6.deb
# fi

# curl -sL "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x99E82A75642AC823" | sudo apt-key add
sudo apt update
sudo apt -y install sbt
