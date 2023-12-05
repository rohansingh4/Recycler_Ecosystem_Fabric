export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/peers/peer0.serviceorg3.example.com/tls/ca.crt
export PEER0_ORG3_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/peers/peer0.logisticsorg3.example.com/tls/ca.crt
export PEER0_ORG4_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/peers/peer0.restarorg1.example.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export PRIVATE_DATA_CONFIG=${PWD}/artifacts/private-data/collections_config.json


export CHANNEL_NAME1="eolchannel10"

setGlobalsForPeer0ServiceOrg3(){
    export CORE_PEER_LOCALMSPID="ServiceOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/users/Admin@serviceorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:19051
}

setGlobalsForPeer1ServiceOrg3(){
    export CORE_PEER_LOCALMSPID="ServiceOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/users/Admin@serviceorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:20051
    
}

setGlobalsForPeer0LogisticsOrg3(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/users/Admin@logisticsorg3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:27051
}

setGlobalsForPeer1LogisticsOrg3(){
    export CORE_PEER_LOCALMSPID="LogisticsOrg3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
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

CHANNEL_NAME1="eolchannel10"
CC_RUNTIME_LANGUAGE="node"
VERSION="1"
CC_SRC_PATH="./artifacts/src/github.com/batterypackeolrequest"
CC_NAME="batterypackeolrequest"

packageChaincode() {
    rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode package ${CC_NAME}.tar.gz \
        --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} \
        --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged on peer0.org1 ===================== "
}
# packageChaincode

installChaincode() {
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.ServiceOrg3 ===================== "

    setGlobalsForPeer0LogisticsOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.LogisticsOrg1 ===================== "

    setGlobalsForPeer0RestarOrg1
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.RestarOrg1 ===================== "
}
# installChaincode

queryInstalled1() {
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.ServiceOrg3 on channel ===================== "
}
# queryInstalled1

queryInstalled3() {
    setGlobalsForPeer0LogisticsOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.LogisticsOrg1 on channel ===================== "
}
# queryInstalled3

queryInstalled4() {
    setGlobalsForPeer0RestarOrg1
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode queryinstalled >&log.txt
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
    setGlobalsForPeer0ServiceOrg3
    # set -x
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --collections-config $PRIVATE_DATA_CONFIG \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}
    # set +x

    echo "===================== chaincode approved from ServiceOrg1 ===================== "

}
# approveForMyOrg1

getBlock() {
    setGlobalsForPeer0ServiceOrg3
    # peer channel fetch 10 -c mychannel -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com --tls \
    #     --cafile $ORDERER_CA

    /home/rohan/fabric/fabric-samples/bin/peer channel getinfo  -c mychannel -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --cafile $ORDERER_CA
}

# getBlock

# --signature-policy "OR ('Org1MSP.member')"
# --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA
# --peerAddresses peer0.org1.example.com:19051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles $PEER0_ORG2_CA
#--channel-config-policy Channel/Application/Admins
# --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer')"

checkCommitReadyness() {
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode checkcommitreadiness \
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

    setGlobalsForPeer0Org1
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from OEMOrg1 ===================== "
}

approveForMyOrg3() {
    setGlobalsForPeer0LogisticsOrg3

    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from LogisticsOrg1 ===================== "
}
#approveForMyOrg3

approveForMyOrg4() {
    setGlobalsForPeer0RestarOrg1

    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from RestarOrg1 ===================== "
}
#approveForMyOrg4

checkCommitReadyness() {

    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from OwnerOrg1 ===================== "
}
#checkCommitReadyness

commitChaincodeDefination() {
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --peerAddresses localhost:27051 --tlsRootCertFiles $PEER0_ORG3_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --version ${VERSION} --sequence ${VERSION} --init-required

}

# commitChaincodeDefination

queryCommitted() {
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
# queryCommitted

queryCommitted3() {
    setGlobalsForPeer0LogisticsOrg3
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted3

queryCommitted4() {
    setGlobalsForPeer0RestarOrg1
    /home/rohan/fabric/fabric-samples/bin/peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}

}
#queryCommitted3

chaincodeInvokeInit() {
    setGlobalsForPeer0ServiceOrg3
    /home/rohan/fabric/fabric-samples/bin/peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --peerAddresses localhost:27051 --tlsRootCertFiles $PEER0_ORG3_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --isInit -c '{"Args":[]}'

}

# chaincodeInvokeInit

chaincodeInvoke() {
    # setGlobalsForPeer0Org1
    # peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
    # --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME1 -n ${CC_NAME} \
    # --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
    # --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA  \
    # -c '{"function":"initLedger","Args":[]}'

    setGlobalsForPeer0ServiceOrg3

    ## Create Car
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME1 -n ${CC_NAME}  \
    #     --peerAddresses localhost:19051 \
    #     --tlsRootCertFiles $PEER0_ORG1_CA \
    #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA   \
    #     -c '{"function": "createCar","Args":["Car-ABCDEEE", "Audi", "R8", "Red", "Pavan"]}'

    # Init ledger
    /home/rohan/fabric/fabric-samples/bin/peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --peerAddresses localhost:27051 --tlsRootCertFiles $PEER0_ORG3_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG4_CA \
        -c '{"function": "initLedger","Args":[]}'

    # ## Add private data
    # export CAR=$(echo -n "{\"key\":\"1111\", \"make\":\"Tesla\",\"model\":\"Tesla A1\",\"color\":\"White\",\"owner\":\"pavan\",\"price\":\"10000\"}" | base64 | tr -d \\n)
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME1 -n ${CC_NAME} \
    #     --peerAddresses localhost:19051 --tlsRootCertFiles $PEER0_ORG1_CA \
    #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA \
    #     -c '{"function": "createPrivateCar", "Args":[]}' \
    #     --transient "{\"car\":\"$CAR\"}"
}

# chaincodeInvoke

chaincodeQuery() {
    setGlobalsForPeer0ServiceOrg3

    # Query all cars
    # peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"Args":["queryAllCars"]}'

    # Query Car by Id
    /home/rohan/fabric/fabric-samples/bin/peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"function": "queryCar","Args":["CAR0"]}'
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