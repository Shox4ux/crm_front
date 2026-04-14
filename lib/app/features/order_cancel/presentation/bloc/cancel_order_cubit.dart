import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order_cancel/data/model/order_cancel_create.dart';
import 'package:crm_app/app/features/order_cancel/data/repo/order_cancel_repo.dart';
import 'package:crm_app/app_storage.dart';
import 'package:equatable/equatable.dart';

part 'cancel_order_state.dart';

class OrderCancelCubit extends Cubit<OrderCancelState> {
  final OrderCancelRepo _repo;

  final AppStorage _storage;
  OrderCancelCubit(this._repo, this._storage) : super(OrderCancelState());

  void cancelOrder({required OrderCancelCreate body}) async {
    emit(state.copyWith(status: OrderCancelStatus.loading));
    var adminId = await _storage.getAdminId();
    if (adminId == null) {
      emit(
        state.copyWith(status: OrderCancelStatus.error, msg: "Admin not found"),
      );
    }
    var newBody = body.copyWith(cancelerId: adminId);
    final res = await _repo.cancelOrder(body: newBody);

    if (res is DataSuccess) {
      emit(state.copyWith(status: OrderCancelStatus.success));
    } else {
      emit(state.copyWith(status: OrderCancelStatus.error, msg: res.errorMsg));
    }
  }
}
