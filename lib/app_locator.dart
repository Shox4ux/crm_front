import 'package:crm_app/api_logger.dart';
import 'package:crm_app/app/features/client/data/source/client_api_service.dart';
import 'package:crm_app/app/features/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/features/user/data/source/user_api_service.dart';
import 'package:crm_app/app/features/user/domain/repo/user_repo.dart';
import 'package:crm_app/app/features/warehouse/data/source/warehouse_api_service.dart';
import 'package:crm_app/app/features/warehouse/domain/repo/warehouse_repo.dart';
import 'package:crm_app/offline_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final dio = Dio();
  dio.interceptors.addAll([ApiLogger(), OfflineInterceptor()]);
  locator.registerSingleton<Dio>(dio);

  // ==================================NEW==============================
  locator.registerSingleton<UserApiService>(UserApiService(locator<Dio>()));
  locator.registerSingleton<WarehouseApiService>(
    WarehouseApiService(locator<Dio>()),
  );

  locator.registerSingleton<UserRepo>(UserRepo(locator<UserApiService>()));
  locator.registerSingleton<WarehouseRepo>(
    WarehouseRepo(locator<WarehouseApiService>()),
  );
  locator.registerSingleton<ClientApiService>(ClientApiService(locator<Dio>()));

  locator.registerSingleton<ClientRepo>(
    ClientRepo(locator<ClientApiService>()),
  );
}
