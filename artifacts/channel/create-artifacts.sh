
chmod -R 0755 ./crypto-config
# Delete existing artifacts
rm -rf ./crypto-config
rm genesis.block mychannel.tx
rm -rf ../../channel-artifacts/*

#Generate Crypto artifactes for organizations
cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/



# System channel
SYS_CHANNEL="sys-channel"

#channel name defaults to "mychannel"
CHANNEL_NAME="mychannel"

echo $CHANNEL_NAME

# Generate System Genesis block
configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL  -outputBlock ./genesis.block


# Generate channel configuration block
configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./mychannel.tx -channelID $CHANNEL_NAME

echo "#######    Generating anchor peer update for ServiceOrg1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./ServiceOrg1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg ServiceOrg1MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./LogistisOrg1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./RestarOrg1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg RestarOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./RestarOrg2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg RestarOrg2MSP

echo "#######    Generating anchor peer update for RestarOrg3MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./RestarOrg3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg RestarOrg3MSP

echo "#######    Generating anchor peer update for ServiceOrg3MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./ServiceOrg3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg ServiceOrg3MSP

echo "#######    Generating anchor peer update for ServiceOrg2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./ServiceOrg2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg ServiceOrg2MSP

echo "#######    Generating anchor peer update for OEMOrg2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./OEMOrg2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg OEMOrg2MSP

echo "#######    Generating anchor peer update for LogisticsOrg2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./LogisticsOrg2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg LogisticsOrg2MSP

echo "#######    Generating anchor peer update for LogisticsOrg3MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./LogisticsOrg3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg LogisticsOrg3MSP

echo "#######    Generating anchor peer update for ServiceOrg4MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./ServiceOrg4MSPanchors.tx -channelID $CHANNEL_NAME -asOrg ServiceOrg4MSP

# channel name defaults to "eolchannel1"
CHANNEL_NAME1="eolchannel1"

echo $CHANNEL_NAME1

# # Generate channel configuration block
configtxgen -profile eolchannel1 -configPath . -outputCreateChannelTx ./eolchannel1.tx -channelID $CHANNEL_NAME1

echo "#######    Generating anchor peer update for ServiceOrg1MSP  ##########"
configtxgen -profile eolchannel1 -configPath . -outputAnchorPeersUpdate ./ServiceOrg1MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg ServiceOrg1MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile eolchannel1 -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile eolchannel1 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg1MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg1MSP  ##########"
configtxgen -profile eolchannel1 -configPath . -outputAnchorPeersUpdate ./RestarOrg1MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg RestarOrg1MSP

# channel name defaults to "eolchannel2"
CHANNEL_NAME2="eolchannel2"

echo $CHANNEL_NAME2

# # Generate channel configuration block
configtxgen -profile eolchannel2 -configPath . -outputCreateChannelTx ./eolchannel2.tx -channelID $CHANNEL_NAME2

echo "#######    Generating anchor peer update for ServiceOrg1MSP  ##########"
configtxgen -profile eolchannel2 -configPath . -outputAnchorPeersUpdate ./ServiceOrg1MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg ServiceOrg1MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile eolchannel2 -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile eolchannel2 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg1MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg2MSP  ##########"
configtxgen -profile eolchannel2 -configPath . -outputAnchorPeersUpdate ./RestarOrg2MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg RestarOrg2MSP

#channel name defaults to "eolchannel3"
CHANNEL_NAME3="eolchannel3"

echo $CHANNEL_NAME3

# # Generate channel configuration block
configtxgen -profile eolchannel3 -configPath . -outputCreateChannelTx ./eolchannel3.tx -channelID $CHANNEL_NAME3

echo "#######    Generating anchor peer update for ServiceOrg1MSP  ##########"
configtxgen -profile eolchannel3 -configPath . -outputAnchorPeersUpdate ./ServiceOrg1MSPanchors_$CHANNEL_NAME3.tx -channelID $CHANNEL_NAME3 -asOrg ServiceOrg1MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile eolchannel3 -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors_$CHANNEL_NAME3.tx -channelID $CHANNEL_NAME3 -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile eolchannel3 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg1MSPanchors_$CHANNEL_NAME3.tx -channelID $CHANNEL_NAME3 -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg3MSP  ##########"
configtxgen -profile eolchannel3 -configPath . -outputAnchorPeersUpdate ./RestarOrg3MSPanchors_$CHANNEL_NAME3.tx -channelID $CHANNEL_NAME3 -asOrg RestarOrg3MSP

#channel name defaults to "eolchannel4"
CHANNEL_NAME4="eolchannel4"

echo $CHANNEL_NAME4

# # Generate channel configuration block
configtxgen -profile eolchannel4 -configPath . -outputCreateChannelTx ./eolchannel4.tx -channelID $CHANNEL_NAME4

echo "#######    Generating anchor peer update for ServiceOrg3MSP  ##########"
configtxgen -profile eolchannel4 -configPath . -outputAnchorPeersUpdate ./ServiceOrg3MSPanchors_$CHANNEL_NAME4.tx -channelID $CHANNEL_NAME4 -asOrg ServiceOrg3MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile eolchannel4 -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors_$CHANNEL_NAME4.tx -channelID $CHANNEL_NAME4 -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile eolchannel4 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg1MSPanchors_$CHANNEL_NAME4.tx -channelID $CHANNEL_NAME4 -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg1MSP  ##########"
configtxgen -profile eolchannel4 -configPath . -outputAnchorPeersUpdate ./RestarOrg1MSPanchors_$CHANNEL_NAME4.tx -channelID $CHANNEL_NAME4 -asOrg RestarOrg1MSP


# # channel name defaults to "eolchannel5"
CHANNEL_NAME5="eolchannel5"

echo $CHANNEL_NAME5

# # Generate channel configuration block
configtxgen -profile eolchannel5 -configPath . -outputCreateChannelTx ./eolchannel5.tx -channelID $CHANNEL_NAME5

echo "#######    Generating anchor peer update for ServiceOrg3MSP  ##########"
configtxgen -profile eolchannel5 -configPath . -outputAnchorPeersUpdate ./ServiceOrg3MSPanchors_$CHANNEL_NAME5.tx -channelID $CHANNEL_NAME5 -asOrg ServiceOrg3MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile eolchannel5 -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors_$CHANNEL_NAME5.tx -channelID $CHANNEL_NAME5 -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile eolchannel5 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg1MSPanchors_$CHANNEL_NAME5.tx -channelID $CHANNEL_NAME5 -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg2MSP  ##########"
configtxgen -profile eolchannel5 -configPath . -outputAnchorPeersUpdate ./RestarOrg2MSPanchors_$CHANNEL_NAME5.tx -channelID $CHANNEL_NAME5 -asOrg RestarOrg2MSP


# # channel name defaults to "eolchannel6"
CHANNEL_NAME6="eolchannel6"

echo $CHANNEL_NAME6

# # Generate channel configuration block
configtxgen -profile eolchannel6 -configPath . -outputCreateChannelTx ./eolchannel6.tx -channelID $CHANNEL_NAME6

echo "#######    Generating anchor peer update for ServiceOrg3MSP  ##########"
configtxgen -profile eolchannel6 -configPath . -outputAnchorPeersUpdate ./ServiceOrg3MSPanchors_$CHANNEL_NAME6.tx -channelID $CHANNEL_NAME6 -asOrg ServiceOrg3MSP

echo "#######    Generating anchor peer update for OEMOrg1MSP  ##########"
configtxgen -profile eolchannel6 -configPath . -outputAnchorPeersUpdate ./OEMOrg1MSPanchors_$CHANNEL_NAME6.tx -channelID $CHANNEL_NAME6 -asOrg OEMOrg1MSP

echo "#######    Generating anchor peer update for LogisticsOrg1MSP  ##########"
configtxgen -profile eolchannel6 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg1MSPanchors_$CHANNEL_NAME6.tx -channelID $CHANNEL_NAME6 -asOrg LogisticsOrg1MSP

echo "#######    Generating anchor peer update for RestarOrg3MSP  ##########"
configtxgen -profile eolchannel6 -configPath . -outputAnchorPeersUpdate ./RestarOrg3MSPanchors_$CHANNEL_NAME6.tx -channelID $CHANNEL_NAME6 -asOrg RestarOrg3MSP


# # channel name defaults to "eolchannel7"
CHANNEL_NAME7="eolchannel7"

echo $CHANNEL_NAME7

# # Generate channel configuration block
configtxgen -profile eolchannel7 -configPath . -outputCreateChannelTx ./eolchannel7.tx -channelID $CHANNEL_NAME7

echo "#######    Generating anchor peer update for ServiceOrg2MSP  ##########"
configtxgen -profile eolchannel7 -configPath . -outputAnchorPeersUpdate ./ServiceOrg2MSPanchors_$CHANNEL_NAME7.tx -channelID $CHANNEL_NAME7 -asOrg ServiceOrg2MSP

echo "#######    Generating anchor peer update for OEMOrg2MSP  ##########"
configtxgen -profile eolchannel7 -configPath . -outputAnchorPeersUpdate ./OEMOrg2MSPanchors_$CHANNEL_NAME7.tx -channelID $CHANNEL_NAME7 -asOrg OEMOrg2MSP

echo "#######    Generating anchor peer update for LogisticsOrg2MSP  ##########"
configtxgen -profile eolchannel7 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg2MSPanchors_$CHANNEL_NAME7.tx -channelID $CHANNEL_NAME7 -asOrg LogisticsOrg2MSP

echo "#######    Generating anchor peer update for RestarOrg1MSP  ##########"
configtxgen -profile eolchannel7 -configPath . -outputAnchorPeersUpdate ./RestarOrg1MSPanchors_$CHANNEL_NAME7.tx -channelID $CHANNEL_NAME7 -asOrg RestarOrg1MSP


# # channel name defaults to "eolchannel8"
CHANNEL_NAME8="eolchannel8"

echo $CHANNEL_NAME8

# # Generate channel configuration block
configtxgen -profile eolchannel8 -configPath . -outputCreateChannelTx ./eolchannel8.tx -channelID $CHANNEL_NAME8

echo "#######    Generating anchor peer update for ServiceOrg2MSP  ##########"
configtxgen -profile eolchannel8 -configPath . -outputAnchorPeersUpdate ./ServiceOrg2MSPanchors_$CHANNEL_NAME8.tx -channelID $CHANNEL_NAME8 -asOrg ServiceOrg2MSP

echo "#######    Generating anchor peer update for OEMOrg2MSP  ##########"
configtxgen -profile eolchannel8 -configPath . -outputAnchorPeersUpdate ./OEMOrg2MSPanchors_$CHANNEL_NAME8.tx -channelID $CHANNEL_NAME8 -asOrg OEMOrg2MSP

echo "#######    Generating anchor peer update for LogisticsOrg2MSP  ##########"
configtxgen -profile eolchannel8 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg2MSPanchors_$CHANNEL_NAME8.tx -channelID $CHANNEL_NAME8 -asOrg LogisticsOrg2MSP

echo "#######    Generating anchor peer update for RestarOrg2MSP  ##########"
configtxgen -profile eolchannel8 -configPath . -outputAnchorPeersUpdate ./RestarOrg2MSPanchors_$CHANNEL_NAME8.tx -channelID $CHANNEL_NAME8 -asOrg RestarOrg2MSP


# # channel name defaults to "eolchannel9"
CHANNEL_NAME9="eolchannel9"

echo $CHANNEL_NAME9

# # Generate channel configuration block
configtxgen -profile eolchannel9 -configPath . -outputCreateChannelTx ./eolchannel9.tx -channelID $CHANNEL_NAME9

echo "#######    Generating anchor peer update for ServiceOrg2MSP  ##########"
configtxgen -profile eolchannel9 -configPath . -outputAnchorPeersUpdate ./ServiceOrg2MSPanchors_$CHANNEL_NAME9.tx -channelID $CHANNEL_NAME9 -asOrg ServiceOrg2MSP

echo "#######    Generating anchor peer update for OEMOrg2MSP  ##########"
configtxgen -profile eolchannel9 -configPath . -outputAnchorPeersUpdate ./OEMOrg2MSPanchors_$CHANNEL_NAME9.tx -channelID $CHANNEL_NAME9 -asOrg OEMOrg2MSP

echo "#######    Generating anchor peer update for LogisticsOrg2MSP  ##########"
configtxgen -profile eolchannel9 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg2MSPanchors_$CHANNEL_NAME9.tx -channelID $CHANNEL_NAME9 -asOrg LogisticsOrg2MSP

echo "#######    Generating anchor peer update for RestarOrg3MSP  ##########"
configtxgen -profile eolchannel9 -configPath . -outputAnchorPeersUpdate ./RestarOrg3MSPanchors_$CHANNEL_NAME9.tx -channelID $CHANNEL_NAME9 -asOrg RestarOrg3MSP


# # channel name defaults to "eolchannel10"
CHANNEL_NAME10="eolchannel10"

echo $CHANNEL_NAME10

# # Generate channel configuration block
configtxgen -profile eolchannel10 -configPath . -outputCreateChannelTx ./eolchannel10.tx -channelID $CHANNEL_NAME10

echo "#######    Generating anchor peer update for ServiceOrg3MSP  ##########"
configtxgen -profile eolchannel10 -configPath . -outputAnchorPeersUpdate ./ServiceOrg3MSPanchors_$CHANNEL_NAME10.tx -channelID $CHANNEL_NAME10 -asOrg ServiceOrg3MSP

echo "#######    Generating anchor peer update for LogisticsOrg3MSP  ##########"
configtxgen -profile eolchannel10 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg3MSPanchors_$CHANNEL_NAME10.tx -channelID $CHANNEL_NAME10 -asOrg LogisticsOrg3MSP

echo "#######    Generating anchor peer update for RestarOrg1MSP  ##########"
configtxgen -profile eolchannel10 -configPath . -outputAnchorPeersUpdate ./RestarOrg1MSPanchors_$CHANNEL_NAME10.tx -channelID $CHANNEL_NAME10 -asOrg RestarOrg1MSP


# # channel name defaults to "eolchannel11"
CHANNEL_NAME11="eolchannel11"

echo $CHANNEL_NAME11

# # Generate channel configuration block
configtxgen -profile eolchannel11 -configPath . -outputCreateChannelTx ./eolchannel11.tx -channelID $CHANNEL_NAME11

echo "#######    Generating anchor peer update for ServiceOrg3MSP  ##########"
configtxgen -profile eolchannel11 -configPath . -outputAnchorPeersUpdate ./ServiceOrg4MSPanchors_$CHANNEL_NAME11.tx -channelID $CHANNEL_NAME11 -asOrg ServiceOrg4MSP

echo "#######    Generating anchor peer update for LogisticsOrg3MSP  ##########"
configtxgen -profile eolchannel11 -configPath . -outputAnchorPeersUpdate ./LogisticsOrg3MSPanchors_$CHANNEL_NAME11.tx -channelID $CHANNEL_NAME11 -asOrg LogisticsOrg3MSP

echo "#######    Generating anchor peer update for RestarOrg1MSP  ##########"
configtxgen -profile eolchannel11 -configPath . -outputAnchorPeersUpdate ./RestarOrg1MSPanchors_$CHANNEL_NAME11.tx -channelID $CHANNEL_NAME11 -asOrg RestarOrg1MSP