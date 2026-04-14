import 'package:crm_app/app/features/admin/data/repo/admin_repo.dart';
import 'package:crm_app/app_storage.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/user/data/model/login_request.dart';
import 'package:crm_app/app/features/user/domain/entity/user_entity.dart';
import 'package:crm_app/app/features/user/domain/repo/user_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _repo;
  final AppStorage _storage;
  final AdminRepo _adminRepo;

  UserCubit(this._repo, this._storage, this._adminRepo)
    : super(UserState(status: UserSStatus.init));

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
      await _storage.decodeAndSaveTokenInfo(token);

      var uId = await _storage.getUserId();
      if (uId == null) return;
      await _saveAdminInfo(uId);
      emit(state.copyWith(status: UserSStatus.login, vUser: res.data));
    } else {
      emit(state.copyWith(status: UserSStatus.error, msg: res.errorMsg));
    }
  }

  Future<void> _saveAdminInfo(int userId) async {
    var res = await _adminRepo.getAdminByUserId(userId: userId);
    if (res is DataSuccess) {
      _storage.saveAdminId(res.data!.id);
    } else {
      emit(
        state.copyWith(status: UserSStatus.error, msg: "Admin data not found"),
      );
    }
  }
}
