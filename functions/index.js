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

const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin SDK
admin.initializeApp();

// Cloud Function to update Firestore with ISS location
exports.updateIssLocation = functions.https.onCall(async (data, context) => {
    try {
        // Log the input data
        console.log("Received data:", data);

        const { latitude, longitude } = data;

        // Log the extracted values
        console.log("Extracted latitude:", latitude, "Extracted longitude:", longitude);

        // Validate input
        if (typeof latitude !== "number" || typeof longitude !== "number") {
            console.error("Invalid input: Latitude and longitude must be numbers.");
            throw new functions.https.HttpsError(
                "invalid-argument",
                "Latitude and longitude must be numbers."
            );
        }

        // Update Firestore
        await admin.firestore().collection("iss_location").doc("location").set({
            lat: latitude,
            long: longitude,
            timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });

        console.log("Firestore update successful");
        return { success: true, message: "Firestore updated successfully" };
    } catch (error) {
        console.error("Firestore update failed:", error);
        throw new functions.https.HttpsError(
            "internal",
            "Failed to update Firestore"
        );
    }
});

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
