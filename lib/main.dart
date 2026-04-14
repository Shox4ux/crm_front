import 'package:crm_app/actions/app_actions.dart';
import 'package:crm_app/app/features/admin/data/repo/admin_repo.dart';
import 'package:crm_app/app/features/admin/presentation/bloc/cubit/admin_cubit.dart';
import 'package:crm_app/app/features/order_cancel/data/repo/order_cancel_repo.dart';
import 'package:crm_app/app/features/order_cancel/presentation/bloc/cancel_order_cubit.dart';
import 'package:crm_app/app_storage.dart';
import 'package:crm_app/app/features/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/core/theme/app_themex.dart';
import 'package:crm_app/app/features/common/cubit/locale_cubit.dart';
import 'package:crm_app/app/features/home/presentation/bloc/drawerx_cubit.dart';
import 'package:crm_app/app/features/order/domain/repo/order_repo.dart';
import 'package:crm_app/app/features/order/presentation/bloc/order_cubit.dart';
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
import 'package:crm_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      BlocProvider(
        create: (_) => UserCubit(
          locator<UserRepo>(),
          locator<AppStorage>(),
          locator<AdminRepo>(),
        ),
      ),
      BlocProvider(create: (_) => OrderCubit(locator<OrderRepo>())),
      BlocProvider(
        create: (_) =>
            ProductCubit(locator<ProductRepo>(), locator<ExpenseRepo>()),
      ),
      BlocProvider(create: (_) => ClientCubit(locator<ClientRepo>())),
      BlocProvider(create: (_) => AdminCubit(locator<AdminRepo>())),
      BlocProvider(create: (_) => OrderCancelCubit(locator<OrderCancelRepo>())),
      BlocProvider(create: (_) => LocaleCubit(locator<AppStorage>())),
    ],

    child: Shortcuts(
      shortcuts: actList,
      child: Actions(
        actions: {
          SubmitIntent: CallbackAction<SubmitIntent>(
            onInvoke: (intent) {
              return null;
            },
          ),
          PopIntent: CallbackAction<PopIntent>(
            onInvoke: (intent) {
              if (AppRouter.router.canPop()) {
                AppRouter.router.pop();
              }
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) => MaterialApp.router(
              locale: locale,
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appTitle,

              localizationsDelegates: const [
                AppLocalizations.delegate, // Your generated delegate
                GlobalMaterialLocalizations.delegate, // Material widgets
                GlobalWidgetsLocalizations.delegate, // Text direction routing
                GlobalCupertinoLocalizations.delegate, // iOS style widgets
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('ru'), // Russian
              ],
              title: 'Alpha CRM',
              scrollBehavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              darkTheme: AppThemeX.dark,
              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            ),
          ),
        ),
      ),
    ),
  );
}
