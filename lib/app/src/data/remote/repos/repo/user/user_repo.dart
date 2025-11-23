import '../../../models/request/auth_write.dart';
import '../../../models/request/user/user_write.dart';
import '../../../models/response/auth/auth_read.dart';
import '../../../models/response/user/user_read.dart';
import '../../base_repo/base_repo.dart';
import '../../base_repo/data_state.dart';
import 'user_repo_impl.dart';
import '../../../service/api_service.dart';

class UserRepo extends BaseRepo implements UserRepoImpl {
  final ApiService _service;
  UserRepo(this._service);

  @override
  Future<DataState<UserRead>> createUser({required UserWrite body}) =>
      getStateOf<UserRead>(request: () => _service.createUser(body: body));

  @override
  Future<DataState<AuthRead>> loginUser({required AuthWrite body}) =>
      getStateOf<AuthRead>(request: () => _service.loginUser(body: body));

  @override
  Future<DataState<UserRead>> verifyUser({required String token}) =>
      getStateOf<UserRead>(request: () => _service.verifyUser(token: token));
}
