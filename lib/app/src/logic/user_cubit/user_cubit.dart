import 'package:crm_app/app/src/data/remote/models/request/auth_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/user/user_read.dart';
import 'package:crm_app/app/src/data/remote/repos/base_repo/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/repos/repo/api_repos.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _repo;

  UserCubit(this._repo) : super(UserState(status: UserSStatus.init));

  void login({required AuthWrite body}) async {
    emit(state.copyWith(status: UserSStatus.loading));
    var res = await _repo.loginUser(body: body);
    if (res is DataSuccess) {
      _verifyToken(res.data!.accessToken);
    } else {
      emit(state.copyWith(status: UserSStatus.error, msg: res.errorMsg));
    }
  }

  void _verifyToken(String token) async {
    var res = await _repo.verifyUser(token: token);
    if (res is DataSuccess) {
      emit(state.copyWith(status: UserSStatus.success, vUser: res.data));
    } else {
      emit(state.copyWith(status: UserSStatus.error, msg: res.errorMsg));
    }
  }
}
