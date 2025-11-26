import 'package:crm_app/api_logger.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/api_repos.dart';
import 'package:crm_app/app/src/data/remote/service/api_service.dart';
import 'package:crm_app/offline_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final dio = Dio();
  dio.interceptors.addAll([ApiLogger(), OfflineInterceptor()]);
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<ApiService>(ApiService(locator<Dio>()));
  // locator.registerLazySingleton<Database>(() => Database());
  // Register DAOs
  // locator.registerSingleton<WarehouseDao>(WarehouseDao(locator<Database>()));
  // locator.registerSingleton<ProductDao>(ProductDao(locator<Database>()));
  locator.registerSingleton<AdminRepo>(AdminRepo(locator<ApiService>()));
  locator.registerSingleton<OrderRepo>(OrderRepo(locator<ApiService>()));
  locator.registerSingleton<OrderProductRepo>(
    OrderProductRepo(locator<ApiService>()),
  );
  locator.registerSingleton<WarehouseRepo>(
    WarehouseRepo(locator<ApiService>()),
  );
  locator.registerSingleton<WarehouseProductRepo>(
    WarehouseProductRepo(locator<ApiService>()),
  );
  locator.registerSingleton<ProductRepo>(ProductRepo(locator<ApiService>()));
  locator.registerSingleton<UserRepo>(UserRepo(locator<ApiService>()));
  locator.registerSingleton<ClientRepo>(ClientRepo(locator<ApiService>()));

  // getIt.registerSingleton<ProductDao>(db.productDao);
  // getIt.registerSingleton<ClientDao>(db.clientDao);
  // getIt.registerSingleton<OrderDao>(db.orderDao);
  // getIt.registerSingleton<AdminDao>(db.adminDao);
}
