import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_expense_read.dart';
import '../models/request/admin_write.dart';
import '../models/request/auth_write.dart';
import '../models/request/client/client_prod_update.dart';
import '../models/request/client/client_update.dart';
import '../models/request/client/client_write.dart';
import '../models/request/order/order_bulk_write.dart';
import '../models/request/order/order_prod_updt.dart';
import '../models/request/order/order_write.dart';
import '../models/request/user/user_update.dart';
import '../models/request/user/user_write.dart';
import '../models/request/warehouse/warehouse_product_write.dart';
import '../models/request/warehouse/warehouse_write.dart';
import '../models/response/admin/admin_read.dart';
import '../models/response/auth/auth_read.dart';
import '../models/response/client/client_read.dart';
import '../models/response/del_read.dart';
import '../models/response/order/order_read.dart';
import '../models/response/product/product_read.dart';
import '../models/response/user/user_read.dart';
import '../models/response/warehouse/warehouse_product_read.dart';
import '../models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl, parser: Parser.MapSerializable)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //=========================== AUTH Endpoints ======================//

  @POST('/auth/login')
  Future<HttpResponse<AuthRead>> loginUser({@Body() required AuthWrite body});

  @POST('/auth/verify_user')
  Future<HttpResponse<UserRead>> verifyUser({
    @Query("token") required String token,
  });

  //=========================== ADMIN Endpoints ======================//

  @GET('/admins/get_all')
  Future<HttpResponse<List<AdminRead>>> getAllAdmin();

  @GET('/admins/get_by_user_id/{user_id}')
  Future<HttpResponse<AdminRead>> getAdminByUserId({
    @Path("user_id") required int userId,
  });

  @POST('/admins/create')
  Future<HttpResponse<AdminRead>> createAdmin({
    @Body() required AdminRequestModel body,
  });

  @DELETE('/admins/delete/{id}')
  Future<HttpResponse<DelRead>> deleteAdmin({@Path("id") required int id});

  //=========================== USER Endpoints ======================//

  @POST('/users/create')
  Future<HttpResponse<UserRead>> createUser({@Body() required UserWrite body});

  @GET('/users/get_by_id/{id}')
  Future<HttpResponse<AdminRead>> getUserById({@Path("id") required int id});

  @GET('/users/get_all')
  Future<HttpResponse<List<UserRead>>> getAllUser();

  @DELETE('/users/delete/{id}')
  Future<HttpResponse<DelRead>> deleteUser({@Path("id") required int id});

  @PATCH('/users/update/{id}')
  Future<HttpResponse<UserRead>> updateUser({
    @Path("id") required int id,
    @Body() required UserUpdate body,
  });

  //=========================== CLIENT Endpoints ======================//

  @POST('/clients/create')
  Future<HttpResponse<ClientWrite>> createClient({
    @Body() required ClientWrite body,
  });

  @GET('/clients/get_by_user_id/{user_id}')
  Future<HttpResponse<ClientRead>> getClientById({
    @Path("user_id") required int userId,
  });

  @GET('/clients/get_all')
  Future<HttpResponse<List<ClientRead>>> getAllClient();

  @DELETE('/clients/delete/{id}')
  Future<HttpResponse<DelRead>> deleteClient({@Path("id") required int id});

  @PATCH('/clients/update/{id}')
  Future<HttpResponse<dynamic>> updateClient({
    @Path("id") required int id,
    @Body() required ClientUpdate body,
  });

  @PATCH('/clients/update_client_product/{cp_id}')
  Future<HttpResponse<dynamic>> updateClientProd({
    @Path("cp_id") required int cpId,
    @Body() required ClientProdUpdate body,
  });

  //=========================== PRODUCT Endpoints ======================//

  @POST('/products/create')
  @MultiPart()
  Future<HttpResponse<ProductRead>> createProduct({
    @Part() MultipartFile? img,
    @Part() required String name,
    @Part(name: "base_price") required double basePrice,
    @Part(name: "sell_price") required double sellPrice,
    @Part(name: "measure") required int measure,
    @Part(name: "total_quantity") required int totalQuantity,
    @Part(name: "active_quantity") required int activeQuantity,
  });

  @GET('/products/get_by_id/{id}')
  Future<HttpResponse<ProductRead>> getProductById({
    @Path("id") required int id,
  });

  @GET('/products/get_all')
  Future<HttpResponse<List<ProductRead>>> getAllProduct();

  @PATCH('/products/update/{id}')
  Future<HttpResponse<dynamic>> updateProduct({
    @Path("id") required int id,
    @Part(name: "img") MultipartFile? img,
    @Part(name: "name") String? name,
    @Part(name: "base_price") double? basePrice,
    @Part(name: "sell_price") double? sellPrice,
    @Part(name: "total_quantity") int? totalQuantity,
    @Part(name: "active_quantity") int? activeQuantity,
  });

  @DELETE('/products/delete/{id}')
  Future<HttpResponse<DelRead>> deleteProduct({@Path("id") required int id});

  //=========================== Product Expense Endpoints ======================//

  @POST('/product_expense/create')
  Future<HttpResponse<dynamic>> createProductExp({
    @Body() required ProductExpenseBulk body,
  });

  @PATCH('/product_expense/update_bulk')
  Future<HttpResponse<dynamic>> updateBulkProductExp({
    @Body() required ProdExpBulkUpdate body,
  });

  @DELETE('/product_expense/update/{id}')
  Future<HttpResponse<ProductExpenseRead>> updateProductExp({
    @Path("id") required int id,
    @Body() required ProductExpenseWrite body,
  });
  @DELETE('/product_expense/delete/{id}')
  Future<HttpResponse<DelRead>> deleteProductExp({@Path("id") required int id});

  //=========================== WarehouseProducts Endpoints ======================//

  @POST('/warehouse_products/create')
  Future<HttpResponse<WarehouseProductRead>> createWProduct({
    @Body() required WarehouseProductWrite body,
  });

  @GET('/warehouse_products/get_by_id/{id}')
  Future<HttpResponse<WarehouseProductRead>> getWProductById({
    @Path("id") required int id,
  });

  @GET('/warehouse_products/get_all')
  Future<HttpResponse<List<WarehouseProductRead>>> getAllWProduct();

  @GET('/warehouse_products/get_all/{ware_id}')
  Future<HttpResponse<List<WarehouseProductRead>>> getAllWProductByWareId({
    @Path("ware_id") required int wareId,
  });

  @DELETE('/warehouse_products/delete/{id}')
  Future<HttpResponse<DelRead>> deleteWProduct({@Path("id") required int id});

  //=========================== Warehouse Endpoints ======================//

  @POST('/warehouses/create')
  Future<HttpResponse<WarehouseRead>> createWarehouse({
    @Body() required WarehouseWrite body,
  });

  @GET('/warehouses/get_by_id/{id}')
  Future<HttpResponse<WarehouseRead>> getWarehouseById({
    @Path("id") required int id,
  });

  @GET('/warehouses/get_all')
  Future<HttpResponse<List<WarehouseRead>>> getAllWarehouse();

  @DELETE('/warehouses/delete/{id}')
  Future<HttpResponse<DelRead>> deleteWarehouse({@Path("id") required int id});

  //=========================== Order Endpoints ======================//

  @POST('/orders/create')
  Future<HttpResponse<OrderRead>> createOrder({
    @Body() required OrderWrite body,
  });

  @GET('/orders/get_by_id/{id}')
  Future<HttpResponse<OrderRead>> getOrderById({@Path("id") required int id});

  @GET('/orders/get_all')
  Future<HttpResponse<List<OrderRead>>> getAllOrder();

  @DELETE('/orders/delete/{id}')
  Future<HttpResponse<DelRead>> deleteOrder({@Path("id") required int id});

  @PATCH('/orders/update/{id}')
  Future<HttpResponse<OrderRead>> updateOrder({
    @Path("id") required int id,
    @Body() required OrderWrite body,
  });

  //=========================== Order Products Endpoints ======================//

  @POST('/order_products/create')
  Future<HttpResponse<dynamic>> createOrderProd({
    @Body() required OrderProdBulkWrite body,
  });

  @GET('/order_products/get_by_id/{id}')
  Future<HttpResponse<OrderRead>> getOrderProdById({
    @Path("id") required int id,
  });

  @GET('/order_products/get_all')
  Future<HttpResponse<List<OrderRead>>> getAllOrderProd();

  @DELETE('/order_products/delete/{id}')
  Future<HttpResponse<dynamic>> deleteOrderProd({@Path("id") required int id});

  @PATCH('/order_products/update/{id}')
  Future<HttpResponse<dynamic>> updateOrderProd({
    @Path("id") required int id,
    @Body() required OrderProdUpdt body,
  });
}
