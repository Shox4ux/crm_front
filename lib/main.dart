import 'package:crm_app/app/src/logic/ware_prod_cubit/ware_prod_cubit.dart';
import 'package:crm_app/app_bloc_observer.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/router/app_router.dart';
import 'package:crm_app/app/utils/theme/app_theme.dart';
import 'package:crm_app/app_locator.dart';
import 'package:crm_app/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/src/data/remote/repos/repo/api_repos.dart';

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
      BlocProvider(create: (_) => DrawerCubit()),
      BlocProvider(create: (_) => ProductCubit(locator<ProductRepo>())),
      BlocProvider(create: (_) => OrderCubit(locator<OrderRepo>())),
      BlocProvider(
        create: (_) => ClientCubit(locator<ClientRepo>(), locator<UserRepo>()),
      ),
      BlocProvider(create: (_) => UserCubit(locator<UserRepo>())),
      BlocProvider(
        create: (_) => AdminCubit(locator<AdminRepo>(), locator<UserRepo>()),
      ),
      BlocProvider(create: (_) => WarehouseCubit(locator<WarehouseRepo>())),
      BlocProvider(
        create: (_) => WareProdCubit(locator<WarehouseProductRepo>()),
      ),
    ],

    child: MaterialApp.router(
      title: 'CRM App',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    ),
  );
}
