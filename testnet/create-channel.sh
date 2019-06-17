export PATH=$PATH:/home/hyperledger/Code/fabric/.build/bin
export FABRIC_CFG_PATH=/home/hyperledger/testnet
peer channel create -o 192.168.0.13:7050 -c ch1 -f ch1.tx
