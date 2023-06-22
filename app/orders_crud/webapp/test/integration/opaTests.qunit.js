sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'orderscrud/test/integration/FirstJourney',
		'orderscrud/test/integration/pages/CreaOrdersList',
		'orderscrud/test/integration/pages/CreaOrdersObjectPage',
		'orderscrud/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CreaOrdersList, CreaOrdersObjectPage, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('orderscrud') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCreaOrdersList: CreaOrdersList,
					onTheCreaOrdersObjectPage: CreaOrdersObjectPage,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);