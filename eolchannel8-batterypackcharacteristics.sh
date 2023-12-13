# !/bin/bash
export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG8_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg2.example.com/peers/peer0.serviceorg2.example.com/tls/ca.crt
export PEER0_ORG9_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/oemorg2.example.com/peers/peer0.oemorg2.example.com/tls/ca.crt
export PEER0_ORG10_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg2.example.com/peers/peer0.logisticsorg2.example.com/tls/ca.crt
export PEER0_ORG5_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/peers/peer0.restarorg2.example.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export PRIVATE_DATA_CONFIG=${PWD}/artifacts/private-data/collections_config_8.json

export CHANNEL_NAME1="eolchannel8"

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
# presetup

CHANNEL_NAME1="eolchannel8"
CC_RUNTIME_LANGUAGE="node"
VERSION="3"
CC_SRC_PATH="./artifacts/src/github.com/batterypackcharacteristics"
CC_NAME="batterypackcharacteristics"

packageChaincode() {
    rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode package ${CC_NAME}.tar.gz \
        --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} \
        --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged on peer0.serviceorg2 ===================== "
}
# packageChaincode

installChaincode() {
    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.ServiceOrg2 ===================== "

    setGlobalsForPeer0OEMOrg2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.OEMOrg2 ===================== "

    setGlobalsForPeer0LogisticsOrg2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.LogisticsOrg2 ===================== "

    setGlobalsForPeer0RestarOrg2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.RestarOrg2 ===================== "
}
# installChaincode

queryInstalled1() {
    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.ServiceOrg2 on channel ===================== "
}
# queryInstalled1

queryInstalled2() {
    setGlobalsForPeer0OEMOrg2
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.OEMOrg2 on channel ===================== "
}
# queryInstalled2

queryInstalled3() {
    setGlobalsForPeer0LogisticsOrg2
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.LogisticsOrg2 on channel ===================== "
}
# queryInstalled3

queryInstalled4() {
    setGlobalsForPeer0RestarOrg2
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.RestarOrg2 on channel ===================== "
}
# queryInstalled4



# --collections-config ./artifacts/private-data/collections_config.json \
#         --signature-policy "OR('Org1MSP.member','Org2MSP.member')" \
# --collections-config $PRIVATE_DATA_CONFIG \

approveForMyOrg1() {
    setGlobalsForPeer0ServiceOrg2
    # set -x
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --collections-config $PRIVATE_DATA_CONFIG \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}
    # set +x

    echo "===================== chaincode approved from ServiceOrg2 ===================== "

}
# approveForMyOrg1

getBlock() {
    setGlobalsForPeer0ServiceOrg2
    # peer channel fetch 10 -c mychannel -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com --tls \
    #     --cafile $ORDERER_CA

    peer channel getinfo  -c mychannel -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --cafile $ORDERER_CA
}

# getBlock

# --signature-policy "OR ('Org1MSP.member')"
# --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA
# --peerAddresses peer0.org1.example.com:21051 --tlsRootCertFiles $PEER0_ORG8_CA --peerAddresses peer0.org2.example.com:23051 --tlsRootCertFiles $PEER0_ORG9_CA
#--channel-config-policy Channel/Application/Admins
# --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer')"

checkCommitReadyness() {
    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode checkcommitreadiness \
        --collections-config $PRIVATE_DATA_CONFIG \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from ServiceOrg2 ===================== "
}
# checkCommitReadyness

# --collections-config ./artifacts/private-data/collections_config.json \
# --signature-policy "OR('Org1MSP.member','Org2MSP.member')" \
approveForMyOrg2() {
    setGlobalsForPeer0OEMOrg2
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from OEMOrg2 ===================== "
}

# approveForMyOrg2

checkCommitReadyness() {

    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from OEMOrg2 ===================== "
}

approveForMyOrg3() {
    setGlobalsForPeer0LogisticsOrg2

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from LogisticsOrg2 ===================== "
}
# approveForMyOrg3

approveForMyOrg4() {
    setGlobalsForPeer0RestarOrg2

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from RestarOrg2 ===================== "
}
# approveForMyOrg4

checkCommitReadyness() {

    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from ServiceOrg2 ===================== "
}
#checkCommitReadyness

commitChaincodeDefination() {
    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
        --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA \
        --peerAddresses localhost:25051 --tlsRootCertFiles $PEER0_ORG10_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_ORG5_CA \
        --version ${VERSION} --sequence ${VERSION} --init-required

}

# commitChaincodeDefination

queryCommitted() {
    setGlobalsForPeer0ServiceOrg2
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
# queryCommitted

queryCommitted2() {
    setGlobalsForPeer0OEMOrg2
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted2

queryCommitted3() {
    setGlobalsForPeer0LogisticsOrg2
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted3

queryCommitted4() {
    setGlobalsForPeer0RestarOrg2
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted3

chaincodeInvokeInit() {
    setGlobalsForPeer0ServiceOrg2
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
        --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA \
        --peerAddresses localhost:25051 --tlsRootCertFiles $PEER0_ORG10_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_ORG5_CA \
        --isInit -c '{"Args":[]}'

}

# chaincodeInvokeInit

chaincodeInvoke() {
    # setGlobalsForPeer0Org1
    # peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
    # --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME1 -n ${CC_NAME} \
    # --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
    # --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA  \
    # -c '{"function":"initLedger","Args":[]}'

    setGlobalsForPeer0ServiceOrg2

    ## Create Car
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME1 -n ${CC_NAME}  \
    #     --peerAddresses localhost:21051 \
    #     --tlsRootCertFiles $PEER0_ORG8_CA \
    #     --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA   \
    #     -c '{"function": "createCar","Args":["Car-ABCDEEE", "Audi", "R8", "Red", "Pavan"]}'

    # Init ledger
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
        --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA \
        --peerAddresses localhost:25051 --tlsRootCertFiles $PEER0_ORG10_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_ORG5_CA \
        -c '{"function": "initLedger","Args":[]}'

    # ## Add private data
    # export CAR=$(echo -n "{\"key\":\"1111\", \"make\":\"Tesla\",\"model\":\"Tesla A1\",\"color\":\"White\",\"owner\":\"pavan\",\"price\":\"10000\"}" | base64 | tr -d \\n)
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME1 -n ${CC_NAME} \
    #     --peerAddresses localhost:21051 --tlsRootCertFiles $PEER0_ORG8_CA \
    #     --peerAddresses localhost:23051 --tlsRootCertFiles $PEER0_ORG9_CA \
    #     -c '{"function": "createPrivateCar", "Args":[]}' \
    #     --transient "{\"car\":\"$CAR\"}"
}

# chaincodeInvoke

chaincodeQuery() {
    setGlobalsForPeer0ServiceOrg2

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

# presetup
packageChaincode
installChaincode
queryInstalled1
queryInstalled2
queryInstalled3
queryInstalled4
approveForMyOrg1
checkCommitReadyness
approveForMyOrg2
approveForMyOrg3
approveForMyOrg4
checkCommitReadyness
commitChaincodeDefination
queryCommitted
queryCommitted2
queryCommitted3
queryCommitted4
chaincodeInvokeInit
sleep 5
chaincodeInvoke
sleep 3