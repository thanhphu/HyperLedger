cd ~/Code/fabric
make

cd ~/Code/fabric/peer
dlv debug --headless --listen=:2345 --log --api-version=2