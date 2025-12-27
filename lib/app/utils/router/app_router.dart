import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/screens/client_add_edit.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/home/presentation/screen/homex.dart';
import 'package:crm_app/app/features/product/presentation/screens/product_add_edit.dart';
import 'package:crm_app/app/features/user/presentation/screen/login_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.productAddEdit,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.productAddEdit,
        builder: (context, state) => const ProductAddEdit(),
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
