scp -Cr Code peer0:~/ &

scp -Cr Code peer1:~/ &
scp -Cr Code peer2:~/ &
scp -Cr Code peer3:~/ &
scp -Cr Code orderer0:~/ &
scp -Cr Code kafka-zookeeper:~/ &
scp -Cr Code fabric-ca:~/ &
scp -Cr Code admin-org0:~/ &
scp -Cr Code admin-org1:~/ &
scp -Cr Code admin-ordererorg0:~/ &



192.168.0.17 peer0
192.168.0.18 peer1
192.168.0.21 peer2
192.168.0.19 peer3
192.168.0.22 orderer0
192.168.0.16 kafka
192.168.0.20 fabric-ca
192.168.0.24 admin-org0
192.168.0.23 admin-org1
192.168.0.25 admin-ordererorg0

scp -r /etc/hosts peer0:~/
scp -r /etc/hosts peer1:~/
scp -r /etc/hosts peer2:~/
scp -r /etc/hosts peer3:~/
scp -r /etc/hosts orderer0:~/
scp -r /etc/hosts kafka:~/
scp -r /etc/hosts fabric-ca:~/
scp -r /etc/hosts admin-org0:~/
scp -r /etc/hosts admin-org1:~/
scp -r /etc/hosts admin-ordererorg0:~/

sudo rm /etc/hosts && sudo ln -s /home/hyperledger/hosts /etc/hosts