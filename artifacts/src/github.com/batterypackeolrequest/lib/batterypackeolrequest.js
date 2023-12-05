'use strict';

const { Contract } = require('fabric-contract-api');

class BatteryPackEOLRequest extends Contract {

    async initLedger(ctx) {
        console.info('============= START : Initialize Ledger ===========');
        const batterypackeolrequest = [
            {
                BatteryAssetNumber: 'BatteryAssetNumber',
                BatteryPackSerialNumber: 'BatteryPackSerialNumber',
                BatteryPackExternalID: 'BatteryPackExternalID',
                BatteryAssetMake: 'BatteryAssetMake',
                BatteryAssetModel: 'BatteryAssetModel',
                BatteryPackReturnID: 'BatteryPackReturnID',
                ReturnStatusCode: 'ReturnStatusCode',
                ReturnStatusDisplay: 'ReturnStatusDisplay',
                ReturnStatusTimestamp: 'ReturnStatusTimestamp',
                ServiceProviderOrgCode: 'ServiceProviderOrgCode',
                ServiceProviderOrgName: 'ServiceProviderOrgName',
                ServiceProviderLocationFullAddress: 'ServiceProviderLocationFullAddress',
                ServiceProviderLocationLat: 'ServiceProviderLocationLat',
                ServiceProviderLocationLong: 'ServiceProviderLocationLong',
                PickupScheduleDate: 'PickupScheduleDate',
                OEMOrgCode: 'OEMOrgCode',
                OEMOrgName: 'OEMOrgName',
                LogisticsProviderOrgCode: 'LogisticsProviderOrgCode',
                LogisticsProviderOrgName: 'LogisticsProviderOrgName',
                RestarProviderOrgCode: 'RestarProviderOrgCode',
                RestarProviderOrgName: 'RestarProviderOrgName',
                RestarProviderLocationFullAddress: 'RestarProviderLocationFullAddress',
                RestarProviderLocationLat: 'RestarProviderLocationLat',
                RestarProviderLocationLong: 'RestarProviderLocationLong',
                DropoffScheduleDate: 'DropoffScheduleDate'
            },
        ];

        for (let i = 0; i < batterypackeolrequest.length; i++) {
            batterypackeolrequest[i].docType = 'batterypackeolrequest';
            await ctx.stub.putState('BatteryPackEOLRequest' + i, Buffer.from(JSON.stringify(batterypackeolrequest[i])));
            console.info('Added <--> ', batterypackeolrequest[i]);
        }
        console.info('============= END : Initialize Ledger ===========');
    }

    async queryBatteryPackEOLRequest(ctx, batteryPackEOLRequestNumber) {
        const batteryPackEOLRequestAsBytes = await ctx.stub.getState(batteryPackEOLRequestNumber);
        if (!batteryPackEOLRequestAsBytes || batteryPackEOLRequestAsBytes.length === 0) {
            throw new Error(`${batteryPackEOLRequestNumber} does not exist`);
        }
        console.log(batteryPackEOLRequestAsBytes.toString());
        return batteryPackEOLRequestAsBytes.toString();
    }

    async createBatteryPackEOLRequest(ctx, batteryPackEOLRequestNumber, BatteryAssetNumber, BatteryPackSerialNumber, BatteryPackExternalID,
        BatteryAssetMake, BatteryAssetModel,  BatteryPackReturnID, ReturnStatusCode, ReturnStatusDisplay,
        ReturnStatusTimestamp, ServiceProviderOrgCode, ServiceProviderOrgName, ServiceProviderLocationFullAddress,ServiceProviderLocationLat, ServiceProviderLocationLong, 
        PickupScheduleDate, OEMOrgCode, OEMOrgName, LogisticsProviderOrgCode, LogisticsProviderOrgName, RestarProviderOrgCode, RestarProviderOrgName, 
        RestarProviderLocationFullAddress, RestarProviderLocationLat, RestarProviderLocationLong, DropoffScheduleDate) {
        console.info('============= START : Create BatteryPackEOLRequest ===========');

        const batterypackeolrequest = {
            BatteryAssetNumber,
            BatteryPackSerialNumber,
            BatteryPackExternalID,
            BatteryAssetMake,
            BatteryAssetModel,
            BatteryPackReturnID,
            ReturnStatusCode,
            ReturnStatusDisplay,
            ReturnStatusTimestamp,
            ServiceProviderOrgCode,
            ServiceProviderOrgName,
            ServiceProviderLocationFullAddress,
            ServiceProviderLocationLat,
            ServiceProviderLocationLong,
            PickupScheduleDate,
            OEMOrgCode,
            OEMOrgName,
            LogisticsProviderOrgCode,
            LogisticsProviderOrgName,
            RestarProviderOrgCode,
            RestarProviderOrgName,
            RestarProviderLocationFullAddress,
            RestarProviderLocationLat,
            RestarProviderLocationLong,
            DropoffScheduleDate,
        };

        await ctx.stub.putState(batteryPackEOLRequestNumber, Buffer.from(JSON.stringify(batterypackeolrequest)));
        console.info('============= END : Create BatteryPackEOLRequest ===========');
    }

    async queryAllBatteryPackEOLRequest(ctx) {
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

module.exports = BatteryPackEOLRequest;