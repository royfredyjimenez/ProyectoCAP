using {z2985_cap_pro_fin as z2985} from '../db/schema';

service ManageOrders {

     entity Header as projection on z2985.SalesOrders.Header;
     entity Items  as projection on z2985.SalesOrders.Items;

}
