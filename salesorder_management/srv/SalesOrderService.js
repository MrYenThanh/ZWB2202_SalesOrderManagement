// Imports
const cds = require("@sap/cds");

/**
 * The service implementation with all service handlers
 */
module.exports = cds.service.impl(async function () {
   // Define constants for the SalesOrder from the SalesOrder.cds file
   const { SalesOrder, BusinessPartners } = this.entities;

   /**
    * Set criticality after a READ operation on /risks
    */
   this.after("READ", SalesOrder, (data) => {
      const salesOrders = Array.isArray(data) ? data : [data];

      salesOrders.forEach((order) => {
         if (order.OverallStatus == "C") {
            order.Criticality = 1; // Negative
         } else if (order.OverallStatus == "D") {
            order.Criticality = 3; // Possitive
         } else if (order.OverallStatus == "N") {
            order.Criticality = 2; // Yellow
         } else {
            order.Criticality = 0; // Neutral
         }
      });
   });

   // connect to remote service
   const BPsrv = await cds.connect.to("API_BUSINESS_PARTNER");

   /**
    * Event-handler for read-events on the BusinessPartners entity.
    * Each request to the API Business Hub requires the apikey in the header.
    */
   this.on("READ", BusinessPartners, async (req) => {
      // The API Sandbox returns alot of business partners with empty names.
      // We don't want them in our application
      req.query.where("LastName <> '' and FirstName <> '' ");

      return await BPsrv.transaction(req).send({
         query: req.query,
         headers: {
            apikey: process.env.apikey,
         },
      });
   });
});
