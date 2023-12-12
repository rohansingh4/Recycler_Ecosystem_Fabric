#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    local PP1=$(one_line_pem $6)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        -e "s#\${PEERPEM1}#$PP1#" \
        -e "s#\${P0PORT1}#$7#" \
        ./ccp-template.json
}

# ORG=1
# P0PORT=9051
# CAPORT=8054
# P0PORT1=10051
# PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/oemorg1.example.com/peers/peer0.oemorg1.example.com/msp/tlscacerts/tlsca.oemorg1.example.com-cert.pem
# PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/oemorg1.example.com/peers/peer1.oemorg1.example.com/msp/tlscacerts/tlsca.oemorg1.example.com-cert.pem
# CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/oemorg1.example.com/msp/tlscacerts/tlsca.oemorg1.example.com-cert.pem


# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-oemorg1.json

# ORG=2
# P0PORT=7051
# CAPORT=7054
# P0PORT1=8051
# PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/serviceorg1.example.com/peers/peer0.serviceorg1.example.com/msp/tlscacerts/tlsca.serviceorg1.example.com-cert.pem
# PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/serviceorg1.example.com/peers/peer1.serviceorg1.example.com/msp/tlscacerts/tlsca.serviceorg1.example.com-cert.pem
# CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/serviceorg1.example.com/msp/tlscacerts/tlsca.serviceorg1.example.com-cert.pem

# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-serviceorg1.json


# ORG=3
# P0PORT=11051
# CAPORT=9054
# P0PORT1=12051
# PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/logisticsorg1.example.com/peers/peer0.logisticsorg1.example.com/msp/tlscacerts/tlsca.logisticsorg1.example.com-cert.pem
# PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/logisticsorg1.example.com/peers/peer1.logisticsorg1.example.com/msp/tlscacerts/tlsca.logisticsorg1.example.com-cert.pem
# CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/logisticsorg1.example.com/msp/tlscacerts/tlsca.logisticsorg1.example.com-cert.pem


# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-logisticsorg1.json

# ORG=4
# P0PORT=13051
# CAPORT=10054
# P0PORT1=14051
# PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/peers/peer0.restarorg1.example.com/msp/tlscacerts/tlsca.restarorg1.example.com-cert.pem
# PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/peers/peer1.restarorg1.example.com/msp/tlscacerts/tlsca.restarorg1.example.com-cert.pem
# CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/restarorg1.example.com/msp/tlscacerts/tlsca.restarorg1.example.com-cert.pem

# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-restarorg1.json

# ORG=5
# P0PORT=19051
# CAPORT=13054
# P0PORT1=20051
# PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/peers/peer0.serviceorg3.example.com/msp/tlscacerts/tlsca.serviceorg3.example.com-cert.pem
# PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/peers/peer1.serviceorg3.example.com/msp/tlscacerts/tlsca.serviceorg3.example.com-cert.pem
# CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/serviceorg3.example.com/msp/tlscacerts/tlsca.serviceorg3.example.com-cert.pem

# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-serviceorg3.json

# ORG=6
# P0PORT=27051
# CAPORT=17054
# P0PORT1=28051
# PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/peers/peer0.logisticsorg3.example.com/msp/tlscacerts/tlsca.logisticsorg3.example.com-cert.pem
# PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/peers/peer1.logisticsorg3.example.com/msp/tlscacerts/tlsca.logisticsorg3.example.com-cert.pem
# CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/logisticsorg3.example.com/msp/tlscacerts/tlsca.logisticsorg3.example.com-cert.pem

# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-logisticsorg3.json

ORG=7
P0PORT=15051
CAPORT=11054
P0PORT1=16051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/peers/peer0.restarorg2.example.com/msp/tlscacerts/tlsca.restarorg2.example.com-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/peers/peer1.restarorg2.example.com/msp/tlscacerts/tlsca.restarorg2.example.com-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/restarorg2.example.com/msp/tlscacerts/tlsca.restarorg2.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-restarorg2.json