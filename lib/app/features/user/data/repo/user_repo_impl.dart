import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/user/data/model/login_request.dart';
import 'package:crm_app/app/features/user/data/model/login_response.dart';
import 'package:crm_app/app/features/user/data/model/user_response.dart';

abstract class UserRepoImpl {
  Future<DataState<LoginResponse>> loginUser({required LoginRequest body});
  Future<DataState<UserResponse>> verifyUser({required String token});
}
