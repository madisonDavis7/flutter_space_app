
//for cloud functions
const { onCall } = require("firebase-functions/v2/https");
const { initializeApp } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");


// Initialize Firebase Admin SDK
initializeApp();

// Cloud Function to update Firestore with ISS location
exports.updateIssLocation = onCall(async (request) => {
    try {
        // Log the input data
        console.log("Received data:", request.data);

        const { latitude, longitude } = request.data;

        // Log the extracted values for figuring out api nonsense
        console.log("Extracted latitude:", latitude, "Extracted longitude:", longitude);

        // Convert to numbers if they're strings, shouln't be strings though...
        const lat = Number(latitude);
        const long = Number(longitude);

        // validateee
        if (isNaN(lat) || isNaN(long)) {
            console.error("Invalid input: Latitude and longitude must be valid numbers.");
            throw new Error("Latitude and longitude must be valid numbers.");
        }

        // Get Firestore instance
        const db = getFirestore();

        // Update Firestore so write to the database dinally and hope for best
        await db.collection("iss_location").doc("location").set({
            lat: lat, //match fields in database
            long: long,
            timestamp: new Date(), //not needed but cool
        });

        console.log("Firestore update successful :)");
        return { success: true, message: "Firestore updated successfully" };
    } catch (error) {
        console.error("Firestore update failed (tragic times):", error);
        throw new Error(`Failed to update Firestore: ${error.message}`);
    }
});
