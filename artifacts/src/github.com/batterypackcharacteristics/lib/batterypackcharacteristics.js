'use strict';

const { Contract } = require('fabric-contract-api');

class BatteryPackCharacteristics extends Contract {

    async initLedger(ctx) {
        console.log("hello")
        console.info('============= START : Initialize Ledger ===========');
        const batterypackcharacteristics = [
            {
                BatteryAssetNumber: 'BatteryAssetNumber',
                BatteryPackSerialNumber: 'BatteryPackSerialNumber',
                BatteryPackExternalID: 'BatteryPackExternalID',
                BatteryPackPartNumber: 'BatteryPackPartNumber',
                BatteryPackTypeName: 'BatteryPackTypeName',
                BatteryPackReturnID: 'BatteryPackReturnID',
                BatteryPackWeight: 'BatteryPackWeight',
                BatteryPackChemistry: 'BatteryPackChemistry',
                BatteryPackEnergy: 'BatteryPackEnergy',
                BatteryPackManufacturingDate: 'BatteryPackManufacturingDate',
                IsDamaged: 'IsDamaged',
                EstimatedPackSOH: 'EstimatedPackSOH',
                ServiceProviderComments: 'ServiceProviderComments',
                BatteryPackDocLink: 'BatteryPackDocLink',
                BatteryPackRemovalDate: 'BatteryPackRemovalDate'
            },
        ];

        for (let i = 0; i < batterypackcharacteristics.length; i++) {
            batterypackcharacteristics[i].docType = 'batterypackcharacteristics';
            await ctx.stub.putState('BatteryPackCharacteristics' + i, Buffer.from(JSON.stringify(batterypackcharacteristics[i])));
            console.info('Added <--> ', batterypackcharacteristics[i]);
        }
        console.info('============= END : Initialize Ledger ===========');
    }

    async queryBatteryPackCharacteristics(ctx, batteryPackCharacteristicsNumber) {
        console.log("hello")
        const batteryPackCharacteristicsAsBytes = await ctx.stub.getState(batteryPackCharacteristicsNumber);
        if (!batteryPackCharacteristicsAsBytes || batteryPackCharacteristicsAsBytes.length === 0) {
            throw new Error(`${batteryPackCharacteristicsNumber} does not exist`);
        }
        console.log(batteryPackCharacteristicsAsBytes.toString());
        return batteryPackCharacteristicsAsBytes.toString();
    }

    async createBatteryPackCharacteristics(ctx, batteryPackCharacteristicsNumber, BatteryAssetNumber, BatteryPackSerialNumber, BatteryPackExternalID,
        BatteryPackPartNumber, BatteryPackTypeName, BatteryPackReturnID, BatteryPackWeight, BatteryPackChemistry, BatteryPackEnergy, BatteryPackManufacturingDate, IsDamaged, EstimatedPackSOH, ServiceProviderComments,
        BatteryPackDocLink, BatteryPackRemovalDate) {
            console.log("hello")
            console.log(ctx);
        console.info('============= START : Create BatteryPackCharacteristics ===========');

        const batterypackcharacteristics = {
            BatteryAssetNumber,
            BatteryPackSerialNumber,
            BatteryPackExternalID,
            BatteryPackPartNumber,
            BatteryPackTypeName,
            BatteryPackReturnID,
            BatteryPackWeight,
            BatteryPackChemistry,
            BatteryPackEnergy,
            BatteryPackManufacturingDate,
            IsDamaged,
            EstimatedPackSOH,
            ServiceProviderComments,
            BatteryPackDocLink,
            BatteryPackRemovalDate
        };

        await ctx.stub.putState(batteryPackCharacteristicsNumber, Buffer.from(JSON.stringify(batterypackcharacteristics)));
        console.info('============= END : Create BatteryPackCharacteristics ===========');
    }

    async queryAllBatteryPackCharacteristics(ctx) {
        const startKey = '';
        const endKey = '';
        const allResults = [];
        for await (const { key, value } of ctx.stub.getStateByRange(startKey, endKey)) {
            const strValue = Buffer.from(value).toString('utf8');
            let record;
            try {
                record = JSON.parse(strValue);
            } catch (err) {
                console.log(err);
                record = strValue;
            }
            allResults.push({ Key: key, Record: record });
        }
        console.info(allResults);
        return JSON.stringify(allResults);
    }

    // async changeCarOwner(ctx, carNumber, newOwner) {
    //     console.info('============= START : changeCarOwner ===========');

    //     const carAsBytes = await ctx.stub.getState(carNumber); // get the car from chaincode state
    //     if (!carAsBytes || carAsBytes.length === 0) {
    //         throw new Error(`${carNumber} does not exist`);
    //     }
    //     const car = JSON.parse(carAsBytes.toString());
    //     car.owner = newOwner;

    //     await ctx.stub.putState(carNumber, Buffer.from(JSON.stringify(car)));
    //     console.info('============= END : changeCarOwner ===========');
    // }

}

module.exports = BatteryPackCharacteristics;