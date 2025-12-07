import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/new/user/data/model/login_request.dart';
import 'package:crm_app/app/new/user/data/model/login_response.dart';
import 'package:crm_app/app/new/user/data/model/user_create.dart';
import 'package:crm_app/app/new/user/data/model/user_response.dart';
import 'package:crm_app/app/new/user/data/repo/user_repo_impl.dart';
import 'package:crm_app/app/new/user/data/source/user_api_service.dart';

import '../../../common/data/repo/base_repo.dart';

class UserRepo extends BaseRepo implements UserRepoImpl {
  final UserApiService _service;
  UserRepo(this._service);

  @override
  Future<DataState<UserResponse>> createUser({required UserCreate body}) =>
      getStateOf<UserResponse>(request: () => _service.createUser(body: body));

  @override
  Future<DataState<LoginResponse>> loginUser({required LoginRequest body}) =>
      getStateOf<LoginResponse>(request: () => _service.loginUser(body: body));

  @override
  Future<DataState<UserResponse>> verifyUser({required String token}) =>
      getStateOf<UserResponse>(
        request: () => _service.verifyUser(token: token),
      );
}
