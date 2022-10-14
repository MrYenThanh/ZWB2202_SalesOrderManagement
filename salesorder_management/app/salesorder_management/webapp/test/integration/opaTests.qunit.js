sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'salesordermanagement/test/integration/FirstJourney',
		'salesordermanagement/test/integration/pages/SalesOrderList',
		'salesordermanagement/test/integration/pages/SalesOrderObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrderList, SalesOrderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('salesordermanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrderList: SalesOrderList,
					onTheSalesOrderObjectPage: SalesOrderObjectPage
                }
            },
            opaJourney.run
        );
    }
);