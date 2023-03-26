using {z2985_cap_pro_fin as z2985} from '../db/schema';

define service CatalogService {

    entity Header as
        select from z2985.SalesOrders.Header {
            ID,
            Email       @mandatory,
            FirstName,
            LastName,
            Country,
            CreatedOn,
            OrderStatus @readonly,
            DeliveryDate,
            ImageUrl,
            to_Items
        };

    entity Items  as
        select from z2985.SalesOrders.Items {
            ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Price,
            Height,
            Width,
            Depth,
            Quantity @(
                mandatory,
                assert.range : [
                    0.00,
                    20.00
                ]
            ),
            to_Header
        };
}