/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const admin = require("firebase-admin");

admin.initializeApp();
const db = admin.firestore();

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const labRef = db.collection('lab').doc('test');

exports.readLab = onRequest({ timeoutSeconds: 15, cors: true, maxInstances: 10 }, (request, response) => {
    //read from labRef and respond to readLab request with data
    labRef.get().then((doc) => {
        if (doc.exists) {
            response.send(doc.data());
        }
        else {
            logger.info("No Such Document :(", { structuredData: true });
        }
    })
});
