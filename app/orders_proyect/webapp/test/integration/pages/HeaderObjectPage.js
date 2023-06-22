sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.ordenes.ordersproyect',
            componentId: 'HeaderObjectPage',
            entitySet: 'Header'
        },
        CustomPageDefinitions
    );
});