import 'package:crm_app/app/new/common/data/repo/base_repo.dart';
import 'package:crm_app/app/new/common/data/repo/data_state.dart';

import '../../../models/request/admin_write.dart';
import '../../../models/response/admin/admin_read.dart';
import '../../../models/response/del_read.dart';
import 'admin_repo_impl.dart';
import '../../../service/api_service.dart';

class AdminRepo extends BaseRepo implements AdminRepoImpl {
  AdminRepo(this._service);
  final ApiService _service;

  @override
  Future<DataState<AdminRead>> createAdmin({required AdminRequestModel body}) {
    return getStateOf<AdminRead>(
      request: () => _service.createAdmin(body: body),
    );
  }

  @override
  Future<DataState<DelRead>> deleteAdmin({required int id}) =>
      getStateOf<DelRead>(request: () => _service.deleteAdmin(id: id));

  @override
  Future<DataState<AdminRead>> getAdminByUserId({required int userId}) =>
      getStateOf<AdminRead>(
        request: () => _service.getAdminByUserId(userId: userId),
      );

  @override
  Future<DataState<List<AdminRead>>> getAllAdmin() =>
      getStateOf<List<AdminRead>>(request: () => _service.getAllAdmin());
}
