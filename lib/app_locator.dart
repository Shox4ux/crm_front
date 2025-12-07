import 'package:crm_app/api_logger.dart';
import 'package:crm_app/app/features/client/data/source/client_api_service.dart';
import 'package:crm_app/app/features/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/features/user/data/source/user_api_service.dart';
import 'package:crm_app/app/features/user/domain/repo/user_repo.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/api_repos.dart'
    hide ClientRepo;
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

  // ==================================NEW==============================
  locator.registerSingleton<UserApiService>(UserApiService(locator<Dio>()));
  locator.registerSingleton<UserRepo>(UserRepo(locator<UserApiService>()));
  locator.registerSingleton<ClientApiService>(ClientApiService(locator<Dio>()));

  locator.registerSingleton<ClientRepo>(
    ClientRepo(locator<ClientApiService>()),
  );
}
