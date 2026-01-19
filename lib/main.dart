import 'package:crm_app/app/features/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/core/theme/app_themex.dart';
import 'package:crm_app/app/features/home/presentation/bloc/cubit/drawerx_cubit.dart';
import 'package:crm_app/app/features/product/data/repo/product_repo.dart';
import 'package:crm_app/app/features/product/presentation/bloc/product_cubit.dart';
import 'package:crm_app/app/features/product_expense/data/repo/expense_repo.dart';
import 'package:crm_app/app/features/user/domain/repo/user_repo.dart';
import 'package:crm_app/app/features/user/presentation/bloc/user_cubit.dart';
import 'package:crm_app/app/features/warehouse/domain/repo/warehouse_repo.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/repo/ware_pro_repo.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/bloc/ware_pro_cubit.dart';
import 'package:crm_app/app_bloc_observer.dart';
import 'package:crm_app/app/features/core/router/app_router.dart';
import 'package:crm_app/app_locator.dart';
import 'package:crm_app/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      BlocProvider(create: (_) => WarehouseCubit(locator<WarehouseRepo>())),
      BlocProvider(create: (_) => WareProCubit(locator<WareProRepo>())),
      BlocProvider(create: (_) => UserCubit(locator<UserRepo>())),
      BlocProvider(
        create: (_) =>
            ProductCubit(locator<ProductRepo>(), locator<ExpenseRepo>()),
      ),
      BlocProvider(create: (_) => ClientCubit(locator<ClientRepo>())),
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
