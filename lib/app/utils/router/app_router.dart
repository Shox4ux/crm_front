import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/logic/order_product_cubit/order_product_cubit.dart';
import 'package:crm_app/app/src/screens.dart';
import 'package:crm_app/app/src/screens/auth/login_screen.dart';
import 'package:crm_app/app/src/screens/clients/client_info_screen.dart';
import 'package:crm_app/app/src/screens/product/product_add_edit_screen.dart';
import 'package:crm_app/app/src/screens/product/product_screen.dart';
import 'package:crm_app/app/src/screens/orders/add_order_screen.dart';
import 'package:crm_app/app/src/screens/orders/order_list_screen.dart';
import 'package:crm_app/app/src/screens/warehouse/warehouse_product_list_screen.dart';
import 'package:crm_app/app/src/screens/warehouse/warehouse_screen.dart';
import 'package:crm_app/app_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../src/data/remote/repos/repo/api_repos.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/product',

    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/main', builder: (context, state) => const MianScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/client_info',
        builder: (context, state) => ClientInfoScreen(),
      ),

      GoRoute(
        path: '/product',
        builder: (context, state) => const ProductScreen(),
      ),
      GoRoute(
        path: '/product_add_edit',
        builder: (context, state) {
          var val = state.extra as ProductRead?;
          if (val == null) {
            return ProductAddEditScreen();
          } else {
            return ProductAddEditScreen(product: val, isEdit: true);
          }
        },
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderListScreen(),
      ),
      GoRoute(
        path: '/add_order',
        builder: (context, state) {
          var val = state.extra as OrderRead?;
          return BlocProvider(
            create: (context) => OrderProdCubit(
              locator<WarehouseRepo>(),
              locator<ClientRepo>(),
              locator<OrderProductRepo>(),
            )..setUpWL(),
            child: AddOrderScreen(orderToEdit: val),
          );
        },
      ),

      GoRoute(
        path: '/warehouse',
        builder: (context, state) => const WarehouseScreen(),
      ),
      GoRoute(
        path: '/warehouse_products',
        builder: (context, state) => const WarehouseProductListScreen(),
      ),
      GoRoute(
        path: '/clients',
        builder: (context, state) => const ClientListScreen(),
      ),
      GoRoute(
        path: '/admins',
        builder: (context, state) => const AdminScreen(),
      ),
    ],
  );
}
