part of 'ware_pro_cubit.dart';

enum WareProStatus { init, loading, success, error, empty }

class WareProState {
  final WareProStatus status;
  final List<WareProResponse> list;
  final String msg;

  const WareProState({
    this.status = WareProStatus.init,
    this.list = const [],
    this.msg = "",
  });

  WareProState copyWith({
    WareProStatus? status,
    List<WareProResponse>? list,
    String? msg,
  }) {
    return WareProState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
    );
  }
}
