import 'package:crm_app/app/features/common/data/repo/data_state.dart';

import '../../../models/request/admin_write.dart';
import '../../../models/response/admin/admin_read.dart';
import '../../../models/response/del_read.dart';

abstract class AdminRepoImpl {
  Future<DataState<List<AdminRead>>> getAllAdmin();
  Future<DataState<DelRead>> deleteAdmin({required int id});
  Future<DataState<AdminRead>> getAdminByUserId({required int userId});
  Future<DataState<AdminRead>> createAdmin({required AdminRequestModel body});
}
