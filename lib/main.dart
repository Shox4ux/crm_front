import 'package:crm_app/app/new/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/new/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/new/core/theme/app_themex.dart';
import 'package:crm_app/app/new/home/presentation/bloc/cubit/drawerx_cubit.dart';
import 'package:crm_app/app/new/user/domain/repo/user_repo.dart';
import 'package:crm_app/app/new/user/presentation/bloc/user_cubit.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/order/order_repo.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/warehouse/warehouse_repo.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/warehouse_product/warehouse_product_repo.dart';
import 'package:crm_app/app/src/logic/ware_prod_cubit/ware_prod_cubit.dart';
import 'package:crm_app/app_bloc_observer.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/router/app_router.dart';
import 'package:crm_app/app_locator.dart';
import 'package:crm_app/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/src/data/remote/repos/repo/product/product_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  NetworkStatusService.instance.initialize();

  await setupLocator();
  runApp(const CRMApp());
}

class CRMApp extends StatelessWidget {
  const CRMApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => DrawerXCubit()),
      BlocProvider(create: (_) => ProductCubit(locator<ProductRepo>())),
      BlocProvider(create: (_) => OrderCubit(locator<OrderRepo>())),
      BlocProvider(create: (_) => UserCubit(locator<UserRepo>())),
      BlocProvider(
        create: (_) => ClientCubit(locator<ClientRepo>(), locator<UserRepo>()),
      ),
      BlocProvider(create: (_) => WarehouseCubit(locator<WarehouseRepo>())),
      BlocProvider(
        create: (_) => WareProdCubit(locator<WarehouseProductRepo>()),
      ),
    ],

    child: MaterialApp.router(
      title: 'CRM App',
      scrollBehavior: ScrollConfiguration.of(
        context,
      ).copyWith(scrollbars: false),
      theme: AppThemeX.light,
      darkTheme: AppThemeX.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    ),
  );
}
