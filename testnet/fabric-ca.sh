sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

export FABRIC_CA_CLIENT_HOME=/home/hyperledger/testnet
export PATH=$PATH:/home/hyperledger/Code/fabric/.build/bin:/home/hyperledger/Code/fabric-ca/bin
----
./fabric-ca-server start -b admin:adminpw --cfg.affiliations.allowremove --cfg.identities.allowremove -d
----
./fabric-ca-client enroll -u http://admin:adminpw@192.168.0.12:7054

fabric-ca-client affiliation remove --force org1
fabric-ca-client affiliation remove --force org2

fabric-ca-client affiliation add org0
fabric-ca-client affiliation add org1
fabric-ca-client affiliation add ordererorg0
----
mkdir -p ~/testnet/crypto-config/peerOrganizations/org0/msp
mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/msp
mkdir -p ~/testnet/crypto-config/ordererOrganizations/ordererorg0/msp

fabric-ca-client getcacert -u http://192.168.0.12:7054 -M ~/testnet/crypto-config/peerOrganizations/org0/msp
fabric-ca-client getcacert -u http://192.168.0.12:7054 -M ~/testnet/crypto-config/peerOrganizations/org1/msp
fabric-ca-client getcacert -u http://192.168.0.12:7054 -M ~/testnet/crypto-config/ordererOrganizations/ordererorg0/msp
----
id:
  name: Admin@org0
  type: client
  affiliation: org0
  maxenrollments: 0
  attributes:
   - name: hf.Registrar.Roles
     value: client,orderer,peer,user
   - name: hf.Registrar.DelegateRoles
     value: client,orderer,peer,user
   - name: hf.Registrar.Attributes
     value: "*"
   - name: hf.genCRL # Can't use in hyperledger 2
     value: true
   - name: hf.Revoker
     value: true
   - name: hf.AffiliationMgr
     value: true
   - name: hf.IntermediateCA
     value: true
   - name: role
     value: admin
     ecert: true
----
fabric-ca-client register --id.secret=ordererorg0password
fabric-ca-client register --id.secret=org0password
fabric-ca-client register --id.secret=org1password
----
mkdir -p ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0
export FABRIC_CA_CLIENT_HOME=/home/hyperledger/testnet
fabric-ca-client enroll -u http://Admin@org0:org0password@192.168.0.12:7054 -H ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0

mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1
export FABRIC_CA_CLIENT_HOME=/home/hyperledger/testnet
fabric-ca-client enroll -u http://Admin@org1:org1password@192.168.0.12:7054 -H ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1

mkdir -p ~/testnet/crypto-config/ordererOrganizations/org0/users/Admin@ordererorg0
export FABRIC_CA_CLIENT_HOME=/home/hyperledger/testnet
fabric-ca-client enroll -u http://Admin@ordererorg0:ordererorg0password@192.168.0.12:7054 -H ~/testnet/crypto-config/ordererOrganizations/ordererorg0/users/Admin@ordererorg0
----

mkdir -p ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0/msp/admincerts
cp ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0/msp/signcerts/cert.pem ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0/msp/admincerts/Admin@org0-cert.pem

mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1/msp/admincerts
cp ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1/msp/signcerts/cert.pem ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1/msp/admincerts/Admin@org1-cert.pem

mkdir -p ~/testnet/crypto-config/ordererOrganizations/ordererorg0/users/Admin@ordererorg0/msp/admincerts
cp ~/testnet/crypto-config/ordererOrganizations/ordererorg0/msp/signcerts/cert.pem ~/testnet/crypto-config/ordererOrganizations/ordererorg0/users/Admin@ordererorg0/msp/admincerts/Admin@ordererorg0-cert.pem

cp -R ordererOrganizations/ordererorg0/users/Admin@ordererorg0/msp/admincerts ordererOrganizations/ordererorg0/msp/

mkdir -p peerOrganizations/org0/msp/admincerts
mkdir -p peerOrganizations/org0/msp/cacerts
mkdir -p peerOrganizations/org1/msp/admincerts
mkdir -p peerOrganizations/org1/msp/cacerts

vi peerOrganizations/org0/msp/admincerts/Admin@org0-cert.pem
vi peerOrganizations/org1/msp/admincerts/Admin@org1-cert.pem

cp ordererOrganizations/ordererorg0/msp/cacerts/192-168-0-12-7054.pem peerOrganizations/org0/msp/cacerts/ca.crt
cp ordererOrganizations/ordererorg0/msp/cacerts/192-168-0-12-7054.pem peerOrganizations/org1/msp/cacerts/ca.crt
----
fabric-ca-client register --id.secret=peer0password -H ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0
fabric-ca-client register --id.secret=peer1password -H ~/testnet/crypto-config/peerOrganizations/org0/users/Admin@org0

fabric-ca-client register --id.secret=peer2password -H ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1
fabric-ca-client register --id.secret=peer3password -H ~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1

fabric-ca-client register --id.secret=orderer0password -H ~/testnet/crypto-config/ordererOrganizations/ordererorg0/users/Admin@ordererorg0/
----

mkdir -p ~/testnet/crypto-config/peerOrganizations/org0/peers/peer0.org0
mkdir -p ~/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0
mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1
mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/peers/peer3.org1
mkdir -p ~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0

fabric-ca-client enroll -u http://peer0:peer0password@192.168.0.12:7054 -H ~/testnet/crypto-config/peerOrganizations/org0/peers/peer0.org0
fabric-ca-client enroll -u http://peer1:peer1password@192.168.0.12:7054 -H ~/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0
fabric-ca-client enroll -u http://peer2:peer2password@192.168.0.12:7054 -H ~/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1
fabric-ca-client enroll -u http://peer3:peer3password@192.168.0.12:7054 -H ~/testnet/crypto-config/peerOrganizations/org1/peers/peer3.org1
fabric-ca-client enroll -u http://orderer0:orderer0password@192.168.0.12:7054 -H ~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0

configtxgen -profile TwoOrgsOrdererGenesis -outputBlock genesis.block -channelID ch1

~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/

rsync -a ~/testnet/crypto-config/ordererOrganizations/ordererorg0/orderers/orderer0.ordererorg0/msp ~/testnet/msp

----

ssh peer1 'mkdir -p ~/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0/msp/admincerts'
ssh peer2 'mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1/msp/admincerts'
ssh peer3 'mkdir -p ~/testnet/crypto-config/peerOrganizations/org1/peers/peer3.org1/msp/admincerts'

scp admin-org1:~/testnet/crypto-config/peerOrganizations/org1/users/Admin@org1/msp/admincerts/Admin@org1-cert.pem .

scp Admin@org0-cert.pem peer0:~/testnet/crypto-config/peerOrganizations/org0/peers/peer0.org0/msp/admincerts
scp Admin@org0-cert.pem peer1:~/testnet/crypto-config/peerOrganizations/org0/peers/peer1.org0/msp/admincerts
scp Admin@org1-cert.pem peer2:~/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1/msp/admincerts
scp Admin@org1-cert.pem peer3:~/testnet/crypto-config/peerOrganizations/org1/peers/peer2.org1/msp/admincerts
----
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ch1.tx -channelID ch1

export FABRIC_CFG_PATH=/home/hyperledger/testnet
export PATH=$PATH:/home/hyperledger/Code/fabric/.build/bin
peer channel join -b genesis.block
----


scp admin-ordererorg0:~/testnet/genesis.block .
scp admin-ordererorg0:~/testnet/ch1.tx .
scp genesis.block orderer0:~/testnet/
scp ch1.tx admin-org0:~/testnet/
scp ch1.tx admin-org1:~/testnet/
