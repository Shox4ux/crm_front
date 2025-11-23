import '../../../models/request/auth_write.dart';
import '../../../models/request/user/user_write.dart';
import '../../../models/response/auth/auth_read.dart';
import '../../../models/response/user/user_read.dart';
import '../../base_repo/data_state.dart';

abstract class UserRepoImpl {
  Future<DataState<UserRead>> createUser({required UserWrite body});
  Future<DataState<AuthRead>> loginUser({required AuthWrite body});
  Future<DataState<UserRead>> verifyUser({required String token});
}
