/*
 * Copyright IBM Corp. All Rights Reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 * 
 */

'use strict';

exports.createDatabaseIfNotExists = function (nano, dbname) {

    return new Promise((async (resolve, reject) => {
        await nano.db.get(dbname, async function (err, body) {
            if (err) {
                if (err.statusCode == 404) {
                    await nano.db.create(dbname, function (err, body) {
                        if (!err) {
                            resolve(true);
                        } else {
                            reject(err);
                        }
                    });
                } else {
                    reject(err);
                }
            } else {
                resolve(true);
            }
        });
    }));
}

exports.writeToCouchDB = async function (nano, dbname, key, value) {
    return new Promise(async (resolve, reject) => {
        try {
            await this.createDatabaseIfNotExists(nano, dbname);
        } catch (error) {
            console.log("Error creating the database-" + error);
        }

        const db = nano.use(dbname);

        // If a key is specified, then attempt to retrieve the record by key
        db.get(key, async function (err, body) {
            console.log('Log before updateValue._rev assignment', body);
            if (err == null) {
                // parse the value
                const updateValue = JSON.parse(JSON.stringify(value));

                // update the revision to allow the update
                if (typeof body === 'object' && body._rev) {
                    updateValue._rev = body._rev;
                }

                console.log('Log after updateValue._rev assignment', updateValue);
                // update the value
                db.insert(updateValue, key, async function (err, body, header) {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(true);
                    }
                });
            } else {
                // If the record is not found, insert a new document
                db.insert(value, key, async function (err, body, header) {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(true);
                    }
                });
            }
        });
    });
};


exports.deleteRecord = async function (nano, dbname, key) {

    return new Promise((async (resolve, reject) => {

        try {
            await this.createDatabaseIfNotExists(nano, dbname);
        } catch (error) {
            console.log("Error creating the database-" + error)
        }

        const db = nano.use(dbname);

        // If a key is specified, then attempt to retrieve the record by key
        db.get(key, async function (err, body) {

            // if the record was found, then update the revision to allow the update
            if (err == null) {

                let revision = body._rev

                // update or insert the value
                db.destroy(key, revision, async function (err, body, header) {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(true);
                    }
                });

            }
        });

    }));
}
