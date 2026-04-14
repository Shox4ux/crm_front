import 'package:crm_app/api_logger.dart';
import 'package:crm_app/app/features/admin/data/repo/admin_repo.dart';
import 'package:crm_app/app/features/admin/data/source/admin_api_service.dart';
import 'package:crm_app/app/features/order_cancel/data/repo/order_cancel_repo.dart';
import 'package:crm_app/app/features/order_cancel/data/source/order_cancel_api_service.dart';
import 'package:crm_app/app_storage.dart';
import 'package:crm_app/app/features/client/data/source/client_api_service.dart';
import 'package:crm_app/app/features/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/features/order/data/source/order_api_service.dart';
import 'package:crm_app/app/features/order/domain/repo/order_repo.dart';
import 'package:crm_app/app/features/product/data/repo/product_repo.dart';
import 'package:crm_app/app/features/product/data/source/remote/product_api_service.dart';
import 'package:crm_app/app/features/product_expense/data/repo/expense_repo.dart';
import 'package:crm_app/app/features/product_expense/data/source/expense_api_service.dart';
import 'package:crm_app/app/features/user/data/source/user_api_service.dart';
import 'package:crm_app/app/features/user/domain/repo/user_repo.dart';
import 'package:crm_app/app/features/warehouse/data/source/warehouse_api_service.dart';
import 'package:crm_app/app/features/warehouse/domain/repo/warehouse_repo.dart';
import 'package:crm_app/app/features/warehouse_prod/data/source/wp_api_service.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/repo/ware_pro_repo.dart';
import 'package:crm_app/offline_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final dio = Dio();
  dio.interceptors.addAll([ApiLogger(), OfflineInterceptor()]);
  locator.registerSingleton<Dio>(dio);

  // ==================================User==============================
  locator.registerSingleton<AppStorage>(AppStorage());
  locator.registerSingleton<UserApiService>(UserApiService(locator<Dio>()));
  locator.registerSingleton<UserRepo>(UserRepo(locator<UserApiService>()));

  // ==================================Warehouse==============================

  locator.registerSingleton<WarehouseApiService>(
    WarehouseApiService(locator<Dio>()),
  );
  locator.registerSingleton<WarehouseRepo>(
    WarehouseRepo(locator<WarehouseApiService>()),
  );
  // ==================================Warehouse Product==============================

  locator.registerSingleton<WPApiService>(WPApiService(locator<Dio>()));
  locator.registerSingleton<WareProRepo>(WareProRepo(locator<WPApiService>()));

  // ==================================Client==============================
  locator.registerSingleton<ClientApiService>(ClientApiService(locator<Dio>()));
  locator.registerSingleton<ClientRepo>(
    ClientRepo(locator<ClientApiService>()),
  );
  // ==================================Product==============================
  locator.registerSingleton<ProductApiService>(
    ProductApiService(locator<Dio>()),
  );
  locator.registerSingleton<ProductRepo>(
    ProductRepo(locator<ProductApiService>()),
  );
  // ==================================Expense==============================
  locator.registerSingleton<ExpenseApiService>(
    ExpenseApiService(locator<Dio>()),
  );
  locator.registerSingleton<ExpenseRepo>(
    ExpenseRepo(locator<ExpenseApiService>()),
  );
  // ==================================Order==============================
  locator.registerSingleton<OrderApiService>(OrderApiService(locator<Dio>()));
  locator.registerSingleton<OrderRepo>(OrderRepo(locator<OrderApiService>()));

  // order Cancel
  locator.registerSingleton<OrderCancelApiService>(
    OrderCancelApiService(locator<Dio>()),
  );
  locator.registerSingleton<OrderCancelRepo>(
    OrderCancelRepo(locator<OrderCancelApiService>()),
  );

  // admin
  locator.registerSingleton<AdminApiService>(AdminApiService(locator<Dio>()));
  locator.registerSingleton<AdminRepo>(AdminRepo(locator<AdminApiService>()));
}
