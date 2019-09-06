export CORE_PEER_LOCALMSPID="Org0MSP"
export CORE_PEER_MSPCONFIGPATH=/home/hyperledger/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0/msp
export CORE_PEER_ADDRESS=peer0:7051
peer chaincode list -C ch1 --instantiated