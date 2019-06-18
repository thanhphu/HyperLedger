export PATH=$PATH:/home/hyperledger/Code/fabric/.build/bin
export FABRIC_CFG_PATH=/home/hyperledger/testnet
peer channel create -o orderer0:7050 -c ch1 -f ch1.tx
