import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/screens/client_add_edit.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/home/presentation/screen/homex.dart';
import 'package:crm_app/app/features/order/presentation/screens/order_add_edit.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/presentation/screens/product_add_edit.dart';
import 'package:crm_app/app/features/user/presentation/screen/login_screen.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/screens/ware_pro_list.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.wareProList,
        builder: (context, state) {
          var val = state.extra as WarehouseEntity?;
          return WarehouseProductList(data: val);
        },
      ),

      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.orderAddEdit,
        builder: (context, state) => const OrderAddEditScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.productAddEdit,
        builder: (context, state) {
          var val = state.extra as ProductEntity?;
          if (val == null) {
            return ProductAddEdit();
          } else {
            return ProductAddEdit(product: val, isEdit: true);
          }
        },
      ),
      GoRoute(
        path: Routes.clientAddEdit,
        builder: (context, state) {
          var val = state.extra as ClientEntity?;
          if (val == null) {
            return ClientAddEdit();
          } else {
            return ClientAddEdit(data: val, isEdit: true);
          }
        },
      ),
    ],
  );
}
