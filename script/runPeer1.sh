CORE_PEER_ENDORSER_ENABLED=true \
CORE_PEER_PROFILE_ENABLED=true \
CORE_PEER_ADDRESS=10.0.1.12:7051 \
CORE_PEER_CHAINCODELISTENADDRESS=10.0.1.12:7052 \
CORE_PEER_ID=org0-peer1 \
CORE_PEER_LOCALMSPID=Org0MSP \
CORE_PEER_GOSSIP_EXTERNALENDPOINT=10.0.1.12:7051 \
CORE_PEER_GOSSIP_USELEADERELECTION=true \
CORE_PEER_GOSSIP_ORGLEADER=false \
CORE_PEER_TLS_ENABLED=false \
CORE_PEER_TLS_KEY_FILE=/home/hyperledger/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0/tls/server.key \
CORE_PEER_TLS_CERT_FILE=/home/hyperledger/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0/tls/server.crt \
CORE_PEER_TLS_ROOTCERT_FILE=/home/hyperledger/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0/tls/ca.crt \
CORE_PEER_TLS_SERVERHOSTOVERRIDE=10.0.1.12 \
CORE_VM_DOCKER_ATTACHSTDOUT=true \
CORE_PEER_MSPCONFIGPATH=/home/hyperledger/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0/msp \
peer node start