export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/hyperledger/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1/msp
export CORE_PEER_ADDRESS=peer2:7051
peer chaincode query -C ch1 -n testnetCC -c '{"Args":["query","b"]}'

