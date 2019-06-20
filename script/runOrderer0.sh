ORDERER_GENERAL_LOGLEVEL=info \
ORDERER_GENERAL_LISTENADDRESS=orderer0 \
ORDERER_GENERAL_GENESISMETHOD=file \
ORDERER_GENERAL_GENESISFILE=/home/hyperledger/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/genesis.block \
ORDERER_GENERAL_LOCALMSPID=OrdererOrg0MSP \
ORDERER_GENERAL_LOCALMSPDIR=/home/hyperledger/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/msp \
ORDERER_GENERAL_TLS_ENABLED=false \
ORDERER_GENERAL_TLS_PRIVATEKEY=/home/hyperledger/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/server.key \
ORDERER_GENERAL_TLS_CERTIFICATE=/home/hyperledger/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/server.crt \
ORDERER_GENERAL_TLS_ROOTCAS=[
/home/hyperledger/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/ca.crt,
/home/hyperledger/testnet/crypto-config/peerOrganizations/org0/peers/peer0.org0/tls/ca.crt,
/home/hyperledger/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1/tls/ca.crt] \
CONFIGTX_ORDERER_BATCHTIMEOUT=1s \
CONFIGTX_ORDERER_ORDERERTYPE=kafka \
CONFIGTX_ORDERER_KAFKA_BROKERS=[kafka:9092] \
orderer


cp ca.crt ./crypto-config/ordererOrganizations/ordererorg0/users/Admin@ordererorg0/msp/cacerts/ca.crt
cp ca.crt ./crypto-config/ordererOrganizations/ordererorg0/msp/cacerts/ca.crt
cp ca.crt ./crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/tls/ca.crt
cp ca.crt ./crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/msp/cacerts/ca.crt
cp ca.crt ./crypto-config/peerOrganizations/org1/msp/cacerts/ca.crt
cp ca.crt ./crypto-config/peerOrganizations/org1/peers/peer2.org1/tls/ca.crt
cp ca.crt ./crypto-config/peerOrganizations/org0/msp/cacerts/ca.crt
cp ca.crt ./crypto-config/peerOrganizations/org0/peers/peer0.org0/tls/ca.crt

cp cert.pem ./ordererOrganizations/ordererorg0/users/Admin@ordererorg0/msp/signcerts/cert.pem
cp cert.pem ./ordererOrganizations/ordererorg0/users/Admin@ordererorg0/msp/admincerts/Admin@ordererorg0-cert.pem
cp cert.pem ./ordererOrganizations/ordererorg0/msp/admincerts/Admin@ordererorg0-cert.pem
cp cert.pem ./ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/msp/signcerts/cert.pem
cp cert.pem ./ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/msp/admincerts/Admin@ordererorg0-cert.pem