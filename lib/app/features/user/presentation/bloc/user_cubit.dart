import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/user/data/model/login_request.dart';
import 'package:crm_app/app/features/user/domain/entity/user_entity.dart';
import 'package:crm_app/app/features/user/domain/repo/user_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _repo;

  UserCubit(this._repo) : super(UserState(status: UserSStatus.init));

  void login({required LoginRequest body}) async {
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
      emit(state.copyWith(status: UserSStatus.login, vUser: res.data));
    } else {
      emit(state.copyWith(status: UserSStatus.error, msg: res.errorMsg));
    }
  }
}
