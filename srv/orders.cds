using {z2985_cap_pro_fin as z2985} from '../db/schema';

service ManageOrders {

     @cds.redirection.target : true
     entity GetOrders  as projection on z2985.SalesOrders.Header;
     entity CreaOrders as projection on z2985.SalesOrders.Header;
     entity SetOrders  as projection on z2985.SalesOrders.Header;
     entity DelOrders  as projection on z2985.SalesOrders.Header;

}
