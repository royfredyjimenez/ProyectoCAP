namespace z2985_cap_pro_fin;

using {
    cuid,
    managed
} from '@sap/cds/common';

type ty_decimal : Decimal(16, 2);

context SalesOrders {

    entity Header: cuid, managed {
        key Id           : UUID;
            Email        : String(65);
            FirstName    : String(30);
            LastName     : String(30);
            Country      : String;
            CreatedOn    : Date;
            DeliveryDate : DateTime;
            OrderStatus  : Integer;
            ImageUrl     : String;
            to_Items     : Composition of many Items
                               on to_Items.to_Header = $self;
    };

    entity Items : cuid, managed {
        Id               : UUID;
        Name             : localized String not null;
        Description      : localized String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : ty_decimal;
        Height           : ty_decimal;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        to_Header        : Association to Header;
    }
}
