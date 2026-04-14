import 'package:crm_app/app/features/admin/data/model/admin_response.dart';
import 'package:crm_app/app/features/admin/data/source/admin_api_service.dart';
import 'package:crm_app/app/features/admin/domain/repo/admin_repo_impl.dart';
import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';

class AdminRepo extends BaseRepo implements AdminRepoImpl {
  final AdminApiService _service;

  AdminRepo(this._service);
  @override
  Future<DataState<AdminResponse>> getAdminByUserId({required int userId}) =>
      getStateOf(request: () => _service.getAdminByUserId(userId: userId));
}
