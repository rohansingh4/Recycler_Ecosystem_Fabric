'use strict';

var { Gateway, Wallets } = require('fabric-network');
const path = require('path');
const FabricCAServices = require('fabric-ca-client');
const fs = require('fs');

const util = require('util');

const getCCP = async (org) => {
    let ccpPath;
    if (org == "OemOrg1") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-oemorg1.json');
    } 
    else if (org == "ServiceOrg1") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-serviceorg1.json');
    }
    else if (org == "ServiceOrg3") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-serviceorg3.json');
    }
    else if (org == "LogisticsOrg1") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-logisticsorg1.json');
    }
    else if (org == "LogisticsOrg3") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-logisticsorg3.json');
    }
    else if (org == "RestarOrg1") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-restarorg1.json');
    }
     
    else
        return null
    const ccpJSON = fs.readFileSync(ccpPath, 'utf8')
    const ccp = JSON.parse(ccpJSON);
    return ccp
}


const getCaUrl = async (org, ccp) => {
    let caURL;
    if (org == "OemOrg1") {
        console.log(ccp.certificateAuthorities['ca.oemorg1.example.com'])
        caURL = ccp.certificateAuthorities['ca.oemorg1.example.com']?.url;
    } 
    else if (org == "ServiceOrg1") {
        caURL = ccp.certificateAuthorities['ca.serviceorg1.example.com']?.url;
    }
    else if (org == "ServiceOrg3") {
        caURL = ccp.certificateAuthorities['ca.serviceorg3.example.com'].url;
    } 
    else if (org == "LogisticsOrg1") {
        caURL = ccp.certificateAuthorities['ca.logisticsorg1.example.com'].url;
    }
    else if (org == "LogisticsOrg3") {
        caURL = ccp.certificateAuthorities['ca.logisticsorg3.example.com'].url;
    } 
    else if (org == "RestarOrg1") {
        caURL = ccp.certificateAuthorities['ca.restarorg1.example.com'].url;
    } 
    else
        return null
    return caURL

}

const getWalletPath = async (org) => {
    let walletPath;
    if (org == "OemOrg1") {
        walletPath = path.join(process.cwd(), 'OemOrg1-wallet');
    } 
    else if (org == "ServiceOrg1") {
        walletPath = path.join(process.cwd(), 'ServiceOrg1-wallet');
    }
    else if (org == "ServiceOrg3") {
        walletPath = path.join(process.cwd(), 'ServiceOrg3-wallet');
    } 
    else if (org == "LogisticsOrg1") {
        walletPath = path.join(process.cwd(), 'LogisticsOrg1-wallet');
    }
    else if (org == "LogisticsOrg3") {
        walletPath = path.join(process.cwd(), 'LogisticsOrg3-wallet');
    } 
    else if (org == "RestarOrg1") {
        walletPath = path.join(process.cwd(), 'RestarOrg1-wallet');
    } 
    else
        return null
    return walletPath

}


const getAffiliation = async (org) => {
    return org == "Org1" ? 'org1.department1' : 'org2.department1'
}

const getRegisteredUser = async (username, userOrg, isJson) => {
    let ccp = await getCCP(userOrg)

    const caURL = await getCaUrl(userOrg, ccp)
    const ca = new FabricCAServices(caURL);

    const walletPath = await getWalletPath(userOrg)
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    const userIdentity = await wallet.get(username);
    if (userIdentity) {
        console.log(`An identity for the user ${username} already exists in the wallet`);
        var response = {
            success: true,
            message: username + ' enrolled Successfully',
        };
        return response
    }

    // Check to see if we've already enrolled the admin user.
    let adminIdentity = await wallet.get('admin');
    if (!adminIdentity) {
        console.log('An identity for the admin user "admin" does not exist in the wallet');
        await enrollAdmin(userOrg, ccp);
        adminIdentity = await wallet.get('admin');
        console.log("Admin Enrolled Successfully")
    }

    // build a user object for authenticating with the CA
    const provider = wallet.getProviderRegistry().getProvider(adminIdentity.type);
    const adminUser = await provider.getUserContext(adminIdentity, 'admin');
    let secret;
    try {
        // Register the user, enroll the user, and import the new identity into the wallet.
        secret = await ca.register({ affiliation: await getAffiliation(userOrg), enrollmentID: username, role: 'client' }, adminUser);
        // const secret = await ca.register({ affiliation: 'org1.department1', enrollmentID: username, role: 'client', attrs: [{ name: 'role', value: 'approver', ecert: true }] }, adminUser);

    } catch (error) {
        return error.message
    }

    const enrollment = await ca.enroll({ enrollmentID: username, enrollmentSecret: secret });
    // const enrollment = await ca.enroll({ enrollmentID: username, enrollmentSecret: secret, attr_reqs: [{ name: 'role', optional: false }] });

    let x509Identity;
    if (userOrg == "OemOrg1") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'OEMOrg1MSP',
            type: 'X.509',
        };
    } 
    else if (userOrg == "ServiceOrg1") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'ServiceOrg1MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "ServiceOrg3") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'ServiceOrg3MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "LogisticsOrg1") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'LogisticsOrg1MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "LogisticsOrg3") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'LogisticsOrg3MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "RestarOrg1") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'RestarOrg1MSP',
            type: 'X.509',
        };
    }

    await wallet.put(username, x509Identity);
    console.log(`Successfully registered and enrolled admin user ${username} and imported it into the wallet`);

    var response = {
        success: true,
        message: username + ' enrolled Successfully',
    };
    return response
}

const isUserRegistered = async (username, userOrg) => {
    const walletPath = await getWalletPath(userOrg)
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    const userIdentity = await wallet.get(username);
    if (userIdentity) {
        console.log(`An identity for the user ${username} exists in the wallet`);
        return true
    }
    return false
}


const getCaInfo = async (org, ccp) => {
    let caInfo
    if (org == "OemOrg1") {
        caInfo = ccp.certificateAuthorities['ca.oemorg1.example.com'];
    } 
    else if (org == "ServiceOrg1") {
        caInfo = ccp.certificateAuthorities['ca.serviceorg1.example.com'];
    }
    else if (org == "ServiceOrg3") {
        caInfo = ccp.certificateAuthorities['ca.serviceorg3.example.com'];
    } 
    else if (org == "LogisticsOrg1") {
        caInfo = ccp.certificateAuthorities['ca.logisticsorg1.example.com'];
    }
    else if (org == "LogisticsOrg3") {
        caInfo = ccp.certificateAuthorities['ca.logisticsorg3.example.com'];
    } 
    else if (org == "RestarOrg1") {
        caInfo = ccp.certificateAuthorities['ca.restarorg1.example.com'];
    } 
    else
        return null
    return caInfo

}

const enrollAdmin = async (org, ccp) => {

    console.log('calling enroll Admin method')

    try {

        const caInfo = await getCaInfo(org, ccp) //ccp.certificateAuthorities['ca.org1.example.com'];
        const caTLSCACerts = caInfo.tlsCACerts.pem;
        const ca = new FabricCAServices(caInfo.url, { trustedRoots: caTLSCACerts, verify: false }, caInfo.caName);

        // Create a new file system based wallet for managing identities.
        const walletPath = await getWalletPath(org) //path.join(process.cwd(), 'wallet');
        const wallet = await Wallets.newFileSystemWallet(walletPath);
        console.log(`Wallet path: ${walletPath}`);

        // Check to see if we've already enrolled the admin user.
        const identity = await wallet.get('admin');
        if (identity) {
            console.log('An identity for the admin user "admin" already exists in the wallet');
            return;
        }

        // Enroll the admin user, and import the new identity into the wallet.
        const enrollment = await ca.enroll({ enrollmentID: 'admin', enrollmentSecret: 'adminpw' });
        let x509Identity;
        if (org == "OemOrg1") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'OEMOrg1MSP',
                type: 'X.509',
            };
        } 
        else if (org == "ServiceOrg1") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'ServiceOrg1MSP',
                type: 'X.509',
            };
        }
        else if (org == "ServiceOrg3") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'ServiceOrg3MSP',
                type: 'X.509',
            };
        }
        else if (org == "LogisticsOrg1") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'LogisticsOrg1MSP',
                type: 'X.509',
            };
        }
        else if (org == "LogisticsOrg3") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'LogisticsOrg3MSP',
                type: 'X.509',
            };
        }
        else if (org == "RestarOrg1") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'RestarOrg1MSP',
                type: 'X.509',
            };
        }
        

        await wallet.put('admin', x509Identity);
        console.log('Successfully enrolled admin user "admin" and imported it into the wallet');
        return
    } catch (error) {
        console.error(`Failed to enroll admin user "admin": ${error}`);
    }
}

const registerAndGerSecret = async (username, userOrg) => {
    let ccp = await getCCP(userOrg)

    const caURL = await getCaUrl(userOrg, ccp)
    const ca = new FabricCAServices(caURL);

    const walletPath = await getWalletPath(userOrg)
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    const userIdentity = await wallet.get(username);
    if (userIdentity) {
        console.log(`An identity for the user ${username} already exists in the wallet`);
        var response = {
            success: true,
            message: username + ' enrolled Successfully',
        };
        return response
    }

    // Check to see if we've already enrolled the admin user.
    let adminIdentity = await wallet.get('admin');
    if (!adminIdentity) {
        console.log('An identity for the admin user "admin" does not exist in the wallet');
        await enrollAdmin(userOrg, ccp);
        adminIdentity = await wallet.get('admin');
        console.log("Admin Enrolled Successfully")
    }

    // build a user object for authenticating with the CA
    const provider = wallet.getProviderRegistry().getProvider(adminIdentity.type);
    const adminUser = await provider.getUserContext(adminIdentity, 'admin');
    let secret;
    try {
        // Register the user, enroll the user, and import the new identity into the wallet.
        secret = await ca.register({ affiliation: await getAffiliation(userOrg), enrollmentID: username, role: 'client' }, adminUser);
        // const secret = await ca.register({ affiliation: 'org1.department1', enrollmentID: username, role: 'client', attrs: [{ name: 'role', value: 'approver', ecert: true }] }, adminUser);

    } catch (error) {
        return error.message
    }

    var response = {
        success: true,
        message: username + ' enrolled Successfully',
        secret: secret
    };
    return response

}

exports.getRegisteredUser = getRegisteredUser

module.exports = {
    getCCP: getCCP,
    getWalletPath: getWalletPath,
    getRegisteredUser: getRegisteredUser,
    isUserRegistered: isUserRegistered,
    registerAndGerSecret: registerAndGerSecret

}
