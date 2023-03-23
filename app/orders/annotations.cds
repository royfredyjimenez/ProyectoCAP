using CatalogService as service from '../../srv/catalog-service';

annotate service.Orders with @UI : {
    
    HeaderInfo          : {
        TypeName       : '{i18n>Order}',
        TypeNamePlural : '{i18n>Orders}',
        ImageUrl       : ImageUrl,
        Title          : {
            $Type : 'UI.DataField',
            Value : Email
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : DeliveryDate
        }
    },
    PresentationVariant : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Email,
            Descending : true
        }]
    },
    SelectionFields     : [
        OrderStatus,
        DeliveryDate
    ],
    LineItem            : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ImageUrl}',
            Value : ImageUrl,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FistName}',
            Value : FirstName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>LastName}',
            Value : LastName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Country}',
            Value : Country,
        },
        {
            Label       : '{i18n>OrderStatus}',
            Value       : OrderStatus,
            Criticality : OrderStatus
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DeliveryDate}',
            Value : DeliveryDate,
        },
                {
            $Type : 'UI.DataField',
            Label : '{i18n>CreatedOn}',
            Value : CreatedOn,
        }
    ]
};

annotate CatalogService.Header with {
    ImageUrl @(UI.IsImageURL : true)
};

annotate CatalogService.Header with @UI : {

    FieldGroup #Header : {Data : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FirstName}',
            Value : FirstName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>LastName}',
            Value : LastName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Country}',
            Value : Country,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderStatus}',
            Value : OrderStatus,
            Criticality : OrderStatus
        }
    ]},

    Facets             : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : '{i18n>Order}',
            ID     : 'Order',
            Facets : [{ // Header information
                $Type  : 'UI.ReferenceFacet',
                ID     : 'DateData',
                Target : '@UI.FieldGroup#Header',
                Label  : '{i18n>Dates}'
            }]
        },
        { // list
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_Items/@UI.LineItem',
            Label  : '{i18n>Item}'
        }
    ]
};

annotate CatalogService.Items with @UI : {
    Identification  : [{Value : Name}],
    HeaderInfo      : {
        TypeName       : '{i18n>Items}',
        TypeNamePlural : '{i18n>Items}',
        Title          : {Value : Name},
        Description    : {
            $Type : 'UI.DataField',
            Value : '{i18n>ID}'
        }
    },
    SelectionFields : [],
    LineItem        : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Description}',
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ReleaseDate}',
            Value : ReleaseDate,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DiscontinuedDate}',
            Value : DiscontinuedDate,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price}',
            Value : Price,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Height}',
            Value : Height,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Width}',
            Value : Width,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Depth}',
            Value : Depth,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Quantity}',
            Value : Quantity,
        }
    ]
};
