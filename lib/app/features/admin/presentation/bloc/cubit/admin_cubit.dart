import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/admin/data/model/admin_response.dart';
import 'package:crm_app/app/features/admin/data/repo/admin_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:equatable/equatable.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepo _repo;
  AdminCubit(this._repo) : super(AdminState());

  void getAdminByUserId({required int userId}) async {
    emit(state.copyWith(status: AdminStateStatus.loading));
    final result = await _repo.getAdminByUserId(userId: userId);
    if (result is DataSuccess) {
      emit(
        state.copyWith(status: AdminStateStatus.success, admin: result.data),
      );
    } else {
      emit(
        state.copyWith(status: AdminStateStatus.error, msg: result.errorMsg),
      );
    }
  }
}
