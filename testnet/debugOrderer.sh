ORDERER_GENERAL_LOGLEVEL=debug
ORDERER_GENERAL_LISTENADDRESS=orderer0
ORDERER_GENERAL_GENESISMETHOD=file
ORDERER_GENERAL_GENESISFILE=~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/genesis.block
ORDERER_GENERAL_LOCALMSPID=OrdererOrg0MSP
ORDERER_GENERAL_LOCALMSPDIR=~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/msp
ORDERER_GENERAL_TLS_ENABLED=false
ORDERER_GENERAL_TLS_PRIVATEKEY=~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/server.key
ORDERER_GENERAL_TLS_CERTIFICATE=~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/server.crt ORDERER_GENERAL_TLS_ROOTCAS=[~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/ca.crt,~/testnet/crypto-config/peerOrganizations/org0/peers/peer0.org0/tls/ca.crt,~/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1/tls/ca.crt]

ORDERER_KAFKA_RETRY_SHORTINTERVAL=1s
ORDERER_KAFKA_RETRY_SHORTTOTAL=30s
ORDERER_KAFKA_VERBOSE=true
CONFIGTX_ORDERER_BATCHTIMEOUT=15s
CONFIGTX_ORDERER_ORDERERTYPE=kafka
CONFIGTX_ORDERER_KAFKA_BROKERS=[kafka:9092]

cd ~/Code/fabric
make

cd ~/Code/fabric/orderer
dlv debug --headless --listen=:2345 --log --api-version=2