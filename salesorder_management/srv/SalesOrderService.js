// Imports
const cds = require("@sap/cds");

/**
 * The service implementation with all service handlers
 */
module.exports = cds.service.impl(async function () {
   // Define constants for the SalesOrder from the SalesOrder.cds file
   const { SalesOrder } = this.entities;

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

});
