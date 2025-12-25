import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/screens/client_add_edit.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/home/presentation/screen/homex.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeXScreen(),
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
