sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/ordenes/ordersproyect/test/integration/FirstJourney',
		'com/ordenes/ordersproyect/test/integration/pages/HeaderList',
		'com/ordenes/ordersproyect/test/integration/pages/HeaderObjectPage',
		'com/ordenes/ordersproyect/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/ordenes/ordersproyect') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);