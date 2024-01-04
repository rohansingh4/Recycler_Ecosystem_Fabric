export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG12_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg4.example.com/peers/peer0.serviceorg4.example.com/tls/ca.crt
export PEER0_ORG11_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/peers/peer0.logisticsorg3.example.com/tls/ca.crt
export PEER0_ORG4_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/peers/peer0.restarorg1.example.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export PRIVATE_DATA_CONFIG=${PWD}/artifacts/private-data/collections_config_11.json


export CHANNEL_NAME1="eolchannel11"

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

# presetup

CHANNEL_NAME1="eolchannel11"
CC_RUNTIME_LANGUAGE="node"
VERSION="5" 
CC_SRC_PATH="./artifacts/src/github.com/batterypackcharacteristics"
CC_NAME="batterypackcharacteristics"

packageChaincode() {
    rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode package ${CC_NAME}.tar.gz \
        --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} \
        --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged Peer0 ServiceOrg4 ===================== "
}
# packageChaincode

installChaincode() {
    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.ServiceOrg4 ===================== "

    setGlobalsForPeer0LogisticsOrg3
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.LogisticsOrg3 ===================== "

    setGlobalsForPeer0RestarOrg1
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.RestarOrg1 ===================== "
}
# installChaincode

queryInstalled1() {
    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.ServiceOrg4 on channel ===================== "
}
# queryInstalled1

queryInstalled3() {
    setGlobalsForPeer0LogisticsOrg3
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.LogisticsOrg3 on channel ===================== "
}
# queryInstalled3

queryInstalled4() {
    setGlobalsForPeer0RestarOrg1
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.RestarOrg1 on channel ===================== "
}
# queryInstalled4



# --collections-config ./artifacts/private-data/collections_config.json \
#         --signature-policy "OR('Org1MSP.member','Org2MSP.member')" \
# --collections-config $PRIVATE_DATA_CONFIG \

approveForMyOrg1() {
    setGlobalsForPeer0ServiceOrg4
    # set -x
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --collections-config $PRIVATE_DATA_CONFIG \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}
    # set +x

    echo "===================== chaincode approved from ServiceOrg4 ===================== "

}
# approveForMyOrg1

getBlock() {
    setGlobalsForPeer0ServiceOrg4
    # peer channel fetch 10 -c mychannel -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com --tls \
    #     --cafile $ORDERER_CA

    peer channel getinfo  -c mychannel -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --cafile $ORDERER_CA
}

# getBlock

# --signature-policy "OR ('Org1MSP.member')"
# --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG11_CA
# --peerAddresses peer0.org1.example.com:29051 --tlsRootCertFiles $PEER0_ORG12_CA --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles $PEER0_ORG11_CA
#--channel-config-policy Channel/Application/Admins
# --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer')"

checkCommitReadyness() {
    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode checkcommitreadiness \
        --collections-config $PRIVATE_DATA_CONFIG \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from org 1 ===================== "
}
# checkCommitReadyness

# --collections-config ./artifacts/private-data/collections_config.json \
# --signature-policy "OR('Org1MSP.member','Org2MSP.member')" \
# approveForMyOrg2() {
#     setGlobalsForPeer0OEMOrg1
#     peer lifecycle chaincode approveformyorg -o localhost:7050 \
#         --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
#         --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
#         --collections-config $PRIVATE_DATA_CONFIG \
#         --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
#         --sequence ${VERSION}

#     echo "===================== chaincode approved from OEMOrg1 ===================== "
# }

# approveForMyOrg2

checkCommitReadyness() {

    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from ServiceOrg4 ===================== "
}

approveForMyOrg3() {
    setGlobalsForPeer0LogisticsOrg3

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from LogisticsOrg3 ===================== "
}
#approveForMyOrg3

approveForMyOrg4() {
    setGlobalsForPeer0RestarOrg1

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from RestarOrg1 ===================== "
}
#approveForMyOrg4

checkCommitReadyness() {

    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from ServiceOrg4 ===================== "
}
#checkCommitReadyness

commitChaincodeDefination() {
    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
        --peerAddresses localhost:27051 --tlsRootCertFiles $PEER0_ORG11_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --version ${VERSION} --sequence ${VERSION} --init-required

}

# commitChaincodeDefination

queryCommitted() {
    setGlobalsForPeer0ServiceOrg4
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
# queryCommitted

queryCommitted3() {
    setGlobalsForPeer0LogisticsOrg3
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted3

queryCommitted4() {
    setGlobalsForPeer0RestarOrg1
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted3

chaincodeInvokeInit() {
    setGlobalsForPeer0ServiceOrg4
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
        --peerAddresses localhost:27051 --tlsRootCertFiles $PEER0_ORG11_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --isInit -c '{"Args":[]}'

}

# chaincodeInvokeInit

chaincodeInvoke() {
    # setGlobalsForPeer0Org1
    # peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
    # --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME1 -n ${CC_NAME} \
    # --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
    # --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG11_CA  \
    # -c '{"function":"initLedger","Args":[]}'

    setGlobalsForPeer0ServiceOrg4

    ## Create Car
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME1 -n ${CC_NAME}  \
    #     --peerAddresses localhost:29051 \
    #     --tlsRootCertFiles $PEER0_ORG12_CA \
    #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG11_CA   \
    #     -c '{"function": "createCar","Args":["Car-ABCDEEE", "Audi", "R8", "Red", "Pavan"]}'

    # Init ledger
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
        --peerAddresses localhost:27051 --tlsRootCertFiles $PEER0_ORG11_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG4_CA \
        -c '{"function": "initLedger","Args":[]}'

    # ## Add private data
    # export CAR=$(echo -n "{\"key\":\"1111\", \"make\":\"Tesla\",\"model\":\"Tesla A1\",\"color\":\"White\",\"owner\":\"pavan\",\"price\":\"10000\"}" | base64 | tr -d \\n)
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME1 -n ${CC_NAME} \
    #     --peerAddresses localhost:29051 --tlsRootCertFiles $PEER0_ORG12_CA \
    #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG11_CA \
    #     -c '{"function": "createPrivateCar", "Args":[]}' \
    #     --transient "{\"car\":\"$CAR\"}"
}

# chaincodeInvoke

chaincodeQuery() {
    setGlobalsForPeer0ServiceOrg4

    # Query all cars
    # peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"Args":["queryAllCars"]}'

    # Query Car by Id
    peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"function": "queryCar","Args":["CAR0"]}'
    #'{"Args":["GetSampleData","Key1"]}'

    # Query Private Car by Id
    # peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"function": "readPrivateCar","Args":["1111"]}'
    # peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"function": "readCarPrivateDetails","Args":["1111"]}'
}

# chaincodeQuery

# Run this function if you add any new dependency in chaincode

#presetup
packageChaincode
installChaincode
queryInstalled1
queryInstalled3
queryInstalled4
approveForMyOrg1
checkCommitReadyness
approveForMyOrg3
approveForMyOrg4
checkCommitReadyness
commitChaincodeDefination
queryCommitted
queryCommitted3
queryCommitted4
chaincodeInvokeInit 
sleep 5
chaincodeInvoke
sleep 3