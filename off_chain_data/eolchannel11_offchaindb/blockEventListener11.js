'use strict';

const { Wallets, Gateway } = require('fabric-network');
const fs = require('fs');
const path = require('path');

const couchdbutil = require('./couchdbutil.js');
const blockProcessing = require('./blockProcessing.js');

const config = require('./config.json');
const channelid = config.channelid;
const peer_name = config.peer_name;
const use_couchdb = config.use_couchdb;
const couchdb_address = config.couchdb_address;

const configPath = path.resolve(__dirname, 'nextblock.txt');

const nano = require('nano')(couchdb_address);

// simple map to hold blocks for processing
class BlockMap {
    constructor() {
        this.list = [];
    }
    get(key) {
        key = parseInt(key, 10).toString();
        return this.list[`block${key}`];
    }
    set(key, value) {
        this.list[`block${key}`] = value;
    }
    remove(key) {
        key = parseInt(key, 10).toString();
        delete this.list[`block${key}`];
    }
}

let ProcessingMap = new BlockMap();

async function main() {
    try {
        // initialize the next block to be 0
        let nextBlock = 0;

        // check to see if there is a next block already defined
        if (fs.existsSync(configPath)) {
            console.log("if");
            // read file containing the next block to read
            nextBlock = fs.readFileSync(configPath, 'utf8');
        } else {
            // store the next block as 0
            console.log("else");
            console.log(`Config path: ${configPath}`);
            fs.writeFileSync(configPath, String(nextBlock));
        }

        // Create a new file system based wallet for managing identities.
        const walletPath = path.join(process.cwd(), 'wallet');
        console.log();
        const wallet = await Wallets.newFileSystemWallet(walletPath);
        console.log(`Wallet path: ${walletPath}`);

        // Check to see if we've already enrolled the user.
        const userExists = await wallet.get('appUser11');
        if (!userExists) {
            console.log('An identity for the user "appUser11" does not exist in the wallet');
            console.log('Run the enrollUser.js application before retrying');
            return;
        }

        // Parse the connection profile. This would be the path to the file downloaded
        // from the IBM Blockchain Platform operational console.
        const ccpPath = path.resolve(__dirname, '../../api-2.0/config/connection-serviceorg4.json');
        const ccp = JSON.parse(fs.readFileSync(ccpPath, 'utf8'));
        // Create a new gateway for connecting to our peer node.
        const gateway = new Gateway();
        await gateway.connect(ccp, { wallet, identity: 'appUser11', discovery: { enabled: true, asLocalhost: true } });

        // Get the network (channel) our contract is deployed to.
        const network = await gateway.getNetwork('eolchannel11');

        const listener = async (event) => {
            // Add the block to the processing map by block number
            await ProcessingMap.set(event.blockNumber, event.blockData);
            console.log(`Added block ${event.blockNumber} to ProcessingMap`);
        };
        const options = { filtered: false, startBlock: parseInt(nextBlock, 10) };
        await network.addBlockListener(listener, options);

        console.log(`Listening for block events, nextblock: ${nextBlock}`);

        // start processing, looking for entries in the ProcessingMap
        processPendingBlocks(ProcessingMap);
    } catch (error) {
        console.error(`Failed to evaluate transaction: ${error}`);
        process.exit(1);
    }
}

// listener function to check for blocks in the ProcessingMap
async function processPendingBlocks(ProcessingMap) {
    setTimeout(async () => {
        // get the next block number from nextblock.txt
        let nextBlockNumber = fs.readFileSync(configPath, 'utf8');
        let processBlock;

        do {
            // get the next block to process from the ProcessingMap
            processBlock = ProcessingMap.get(nextBlockNumber);

            if (processBlock === undefined) {
                break;
            }

            try {
                await blockProcessing.processBlockEvent(channelid, processBlock, use_couchdb, nano);
            } catch (error) {
                console.error(`Failed to process block: ${error}`);
            }

            // if successful, remove the block from the ProcessingMap
            ProcessingMap.remove(nextBlockNumber);

            // increment the next block number to the next block
            fs.writeFileSync(configPath, String(parseInt(nextBlockNumber, 10) + 1));

            // retrieve the next block number to process
            nextBlockNumber = fs.readFileSync(configPath, 'utf8');
        } while (true);

        processPendingBlocks(ProcessingMap);
    }, 250);
}

main();
