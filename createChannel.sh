export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg1.example.com/peers/peer0.serviceorg1.example.com/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg1.example.com/peers/peer0.oemorg1.example.com/tls/ca.crt
export PEER0_ORG3_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg1.example.com/peers/peer0.logisticsorg1.example.com/tls/ca.crt
export PEER0_ORG4_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/peers/peer0.restarorg1.example.com/tls/ca.crt
export PEER0_ORG5_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/peers/peer0.restarorg2.example.com/tls/ca.crt
export PEER0_ORG6_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg3.example.com/peers/peer0.restarorg3.example.com/tls/ca.crt
export PEER0_ORG7_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/peers/peer0.serviceorg3.example.com/tls/ca.crt
export PEER0_ORG8_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg2.example.com/peers/peer0.serviceorg2.example.com/tls/ca.crt
export PEER0_ORG9_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg2.example.com/peers/peer0.oemorg2.example.com/tls/ca.crt
export PEER0_ORG10_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg2.example.com/peers/peer0.logisticsorg2.example.com/tls/ca.crt
export PEER0_ORG11_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/peers/peer0.logisticsorg3.example.com/tls/ca.crt
export PEER0_ORG12_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg4.example.com/peers/peer0.serviceorg4.example.com/tls/ca.crt

export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export CHANNEL_NAME=mychannel
export CHANNEL_NAME1=eolchannel1
export CHANNEL_NAME2=eolchannel2
export CHANNEL_NAME3=eolchannel3
export CHANNEL_NAME4=eolchannel4
export CHANNEL_NAME5=eolchannel5
export CHANNEL_NAME6=eolchannel6
export CHANNEL_NAME7=eolchannel7
export CHANNEL_NAME8=eolchannel8
export CHANNEL_NAME9=eolchannel9
export CHANNEL_NAME10=eolchannel10
export CHANNEL_NAME11=eolchannel11


# setGlobalsForOrderer(){
#     export CORE_PEER_LOCALMSPID="OrdererMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp
    
# }

#ServiceOrg1
setGlobalsForPeer0ServiceOrg1(){
    export CORE_PEER_LOCALMSPID="ServiceOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg1.example.com/users/Admin@serviceorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer1ServiceOrg1(){
    export CORE_PEER_LOCALMSPID="ServiceOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg1.example.com/users/Admin@serviceorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:8051
    
}

#OEMOrg1
setGlobalsForPeer0OEMOrg1(){
    export CORE_PEER_LOCALMSPID="OEMOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg1.example.com/users/Admin@oemorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:9051
    
}

setGlobalsForPeer1OEMOrg1(){
    export CORE_PEER_LOCALMSPID="OEMOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg1.example.com/users/Admin@oemorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:10051
    
}

#LogisticsOrg1
setGlobalsForPeer0LogisticsOrg1(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg1.example.com/users/Admin@logisticsorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:11051
}

setGlobalsForPeer1LogisticsOrg1(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg1.example.com/users/Admin@logisticsorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:12051
    
}

#RestarOrg1
setGlobalsForPeer0RestarOrg1(){
    export CORE_PEER_LOCALMSPID="RestarOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG4_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/users/Admin@restarorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:13051
}

setGlobalsForPeer1RestarOrg1(){
    export CORE_PEER_LOCALMSPID="RestarOrg1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG4_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/users/Admin@restarorg1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:14051
    
}

#RestarOrg2
setGlobalsForPeer0RestarOrg2(){
    export CORE_PEER_LOCALMSPID="RestarOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG5_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/users/Admin@restarorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:15051
}

setGlobalsForPeer1RestarOrg2(){
    export CORE_PEER_LOCALMSPID="RestarOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG5_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/users/Admin@restarorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:16051
    
}

#RestarOrg3
setGlobalsForPeer0RestarOrg3(){
    export CORE_PEER_LOCALMSPID="RestarOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG6_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg3.example.com/users/Admin@restarorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:17051
}

setGlobalsForPeer1RestarOrg3(){
    export CORE_PEER_LOCALMSPID="RestarOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG6_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg3.example.com/users/Admin@restarorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:18051
    
}

#ServiceOrg3
setGlobalsForPeer0ServiceOrg3(){
    export CORE_PEER_LOCALMSPID="ServiceOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG7_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/users/Admin@serviceorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:19051
}

setGlobalsForPeer1ServiceOrg3(){
    export CORE_PEER_LOCALMSPID="ServiceOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG7_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/users/Admin@serviceorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:20051
    
}

#ServiceOrg2
setGlobalsForPeer0ServiceOrg2(){
    export CORE_PEER_LOCALMSPID="ServiceOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG8_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg2.example.com/users/Admin@serviceorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:21051
}

setGlobalsForPeer1ServiceOrg2(){
    export CORE_PEER_LOCALMSPID="ServiceOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG8_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg2.example.com/users/Admin@serviceorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:22051
    
}

#oemorg2
setGlobalsForPeer0OEMOrg2(){
    export CORE_PEER_LOCALMSPID="OEMOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG9_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg2.example.com/users/Admin@oemorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:23051
    
}

setGlobalsForPeer1OEMOrg2(){
    export CORE_PEER_LOCALMSPID="OEMOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG9_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg2.example.com/users/Admin@oemorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:24051
    
}

#logisticsorg2
setGlobalsForPeer0LogisticsOrg2(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG10_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg2.example.com/users/Admin@logisticsorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:25051
}

setGlobalsForPeer1LogisticsOrg2(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG10_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg2.example.com/users/Admin@logisticsorg2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:26051
    
}

#logisticsorg3
setGlobalsForPeer0LogisticsOrg3(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG11_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/users/Admin@logisticsorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:27051
}

setGlobalsForPeer1LogisticsOrg3(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG11_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/users/Admin@logisticsorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:28051
    
}

#serviceorg4
setGlobalsForPeer0ServiceOrg4(){
    export CORE_PEER_LOCALMSPID="ServiceOrg4MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG12_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg4.example.com/users/Admin@serviceorg4.example.com/msp
    export CORE_PEER_ADDRESS=localhost:29051
}

setGlobalsForPeer1ServiceOrg4(){
    export CORE_PEER_LOCALMSPID="ServiceOrg4MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG12_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg4.example.com/users/Admin@serviceorg4.example.com/msp
    export CORE_PEER_ADDRESS=localhost:30051
    
}

createChannel(){
    rm -rf ./channel-artifacts/*
    setGlobalsForPeer0ServiceOrg1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel1(){
    setGlobalsForPeer0ServiceOrg1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME1 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME1}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME1}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel2(){
    setGlobalsForPeer0ServiceOrg1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME2 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME2}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME2}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel3(){
    setGlobalsForPeer0ServiceOrg1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME3 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME3}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME3}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel4(){
    setGlobalsForPeer0ServiceOrg3
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME4 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME4}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME4}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel5(){
    setGlobalsForPeer0ServiceOrg3
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME5 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME5}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME5}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel6(){
    setGlobalsForPeer0ServiceOrg3
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME6 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME6}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME6}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel7(){
    setGlobalsForPeer0ServiceOrg2
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME7 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME7}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME7}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel8(){
    setGlobalsForPeer0ServiceOrg2
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME8 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME8}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME8}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel9(){
    setGlobalsForPeer0ServiceOrg2
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME9 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME9}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME9}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel10(){
    setGlobalsForPeer0ServiceOrg3
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME10 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME10}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME10}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel11(){
    setGlobalsForPeer0ServiceOrg4
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME11 \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/channel/${CHANNEL_NAME11}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME11}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

removeOldCrypto(){
    rm -rf ./api-1.4/crypto/*
    rm -rf ./api-1.4/fabric-client-kv-org1/*
    rm -rf ./api-2.0/org1-wallet/*
    rm -rf ./api-2.0/org2-wallet/*
}


joinChannel(){
    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0OEMOrg2 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1OEMOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0ServiceOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1ServiceOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0ServiceOrg2 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1ServiceOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0ServiceOrg3 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1ServiceOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0ServiceOrg4 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1ServiceOrg4
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0LogisticsOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1LogisticsOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    # setGlobalsForPeer0LogisticsOrg4
    # peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    # setGlobalsForPeer1LogisticsOrg4
    # peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
}

joinChannel1(){
    setGlobalsForPeer0ServiceOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1ServiceOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
}

joinChannel2(){
    setGlobalsForPeer0ServiceOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1ServiceOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

    setGlobalsForPeer0RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

}

joinChannel3(){
    setGlobalsForPeer0ServiceOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block
    
    setGlobalsForPeer1ServiceOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block

    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block

    setGlobalsForPeer0RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block
    
    setGlobalsForPeer1RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME3.block
}

joinChannel4(){
    setGlobalsForPeer0ServiceOrg3 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block
    
    setGlobalsForPeer1ServiceOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block

    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block

    setGlobalsForPeer0RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block
    
    setGlobalsForPeer1RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME4.block

}

joinChannel5(){
    setGlobalsForPeer0ServiceOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block
    
    setGlobalsForPeer1ServiceOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block

    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block

    setGlobalsForPeer0RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block
    
    setGlobalsForPeer1RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME5.block
}

joinChannel6(){
    setGlobalsForPeer0ServiceOrg3 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block
    
    setGlobalsForPeer1ServiceOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block

    setGlobalsForPeer0OEMOrg1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block
    
    setGlobalsForPeer1OEMOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block

    setGlobalsForPeer0LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block
    
    setGlobalsForPeer1LogisticsOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block

    setGlobalsForPeer0RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block
    
    setGlobalsForPeer1RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME6.block
}

joinChannel7(){
    setGlobalsForPeer0ServiceOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block
    
    setGlobalsForPeer1ServiceOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block

    setGlobalsForPeer0OEMOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block
    
    setGlobalsForPeer1OEMOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block

    setGlobalsForPeer0LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block
    
    setGlobalsForPeer1LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block

    setGlobalsForPeer0RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block
    
    setGlobalsForPeer1RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME7.block
}

joinChannel8(){
    setGlobalsForPeer0ServiceOrg2 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block
    
    setGlobalsForPeer1ServiceOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block

    setGlobalsForPeer0OEMOrg2 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block
    
    setGlobalsForPeer1OEMOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block

    setGlobalsForPeer0LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block
    
    setGlobalsForPeer1LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block

    setGlobalsForPeer0RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block
    
    setGlobalsForPeer1RestarOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME8.block
}

joinChannel9(){
    setGlobalsForPeer0ServiceOrg2 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block
    
    setGlobalsForPeer1ServiceOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block

    setGlobalsForPeer0OEMOrg2 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block
    
    setGlobalsForPeer1OEMOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block

    setGlobalsForPeer0LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block
    
    setGlobalsForPeer1LogisticsOrg2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block

    setGlobalsForPeer0RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block
    
    setGlobalsForPeer1RestarOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME9.block
}

joinChannel10(){
    setGlobalsForPeer0ServiceOrg3 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME10.block
    
    setGlobalsForPeer1ServiceOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME10.block

    setGlobalsForPeer0LogisticsOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME10.block
    
    setGlobalsForPeer1LogisticsOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME10.block

    setGlobalsForPeer0RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME10.block
    
    setGlobalsForPeer1RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME10.block
}

joinChannel11(){
    setGlobalsForPeer0ServiceOrg4 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME11.block
    
    setGlobalsForPeer1ServiceOrg4
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME11.block

    setGlobalsForPeer0LogisticsOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME11.block
    
    setGlobalsForPeer1LogisticsOrg3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME11.block

    setGlobalsForPeer0RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME11.block
    
    setGlobalsForPeer1RestarOrg1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME11.block

}


updateAnchorPeers(){
    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0OEMOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA    

    setGlobalsForPeer0RestarOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0RestarOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0RestarOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0ServiceOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0ServiceOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0ServiceOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0ServiceOrg4
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA    

    setGlobalsForPeer0LogisticsOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
}

updateAnchorPeers1(){
    setGlobalsForPeer0ServiceOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers2(){
    setGlobalsForPeer0ServiceOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers3(){
    setGlobalsForPeer0ServiceOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME3 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME3}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME3 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME3}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME3 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME3}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME3 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME3}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers4(){
    setGlobalsForPeer0ServiceOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME4 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME4}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME4 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME4}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME4 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME4}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME4 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME4}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers5(){
    setGlobalsForPeer0ServiceOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME5 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME5}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME5 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME5}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME5 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME5}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME5 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME5}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers6(){
    setGlobalsForPeer0ServiceOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME6 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME6}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME6 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME6}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME6 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME6}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME6 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME6}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers7(){
    setGlobalsForPeer0ServiceOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME7 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME7}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME7 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME7}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME7 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME7}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME7 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME7}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers8(){
    setGlobalsForPeer0ServiceOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME8 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME8}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME8 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME8}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME8 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME8}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME8 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME8}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers9(){
    setGlobalsForPeer0ServiceOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME9 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME9}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0OEMOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME9 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME9}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME9 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME9}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME9 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME9}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers10(){
    setGlobalsForPeer0ServiceOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME10 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME10}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME10 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME10}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME10 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME10}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers11(){
    setGlobalsForPeer0ServiceOrg4
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME11 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME11}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0LogisticsOrg3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME11 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME11}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RestarOrg1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME11 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME11}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}
# removeOldCrypto

# createChannel
createChannel1
createChannel2
createChannel3
createChannel4
createChannel5
createChannel6
createChannel7
createChannel8
createChannel9
createChannel10
createChannel11

# joinChannel
joinChannel1
joinChannel2
joinChannel3
joinChannel4
joinChannel5
joinChannel6
joinChannel7
joinChannel8
joinChannel9
joinChannel10
joinChannel11

# updateAnchorPeers
updateAnchorPeers1
updateAnchorPeers2
updateAnchorPeers3
updateAnchorPeers4
updateAnchorPeers5
updateAnchorPeers6
updateAnchorPeers7
updateAnchorPeers8
updateAnchorPeers9
updateAnchorPeers10
updateAnchorPeers11