import 'package:crm_app/app/features/admin/data/model/admin_response.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';

abstract class AdminRepoImpl {
  Future<DataState<AdminResponse>> getAdminByUserId({required int userId});
}
