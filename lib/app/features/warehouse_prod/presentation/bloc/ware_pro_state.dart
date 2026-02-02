part of 'ware_pro_cubit.dart';

enum WareProStatus { init, loading, success, error, empty }

class WareProState {
  final WareProStatus status;
  final List<WareProResponse> list;
  final List<WareProResponse> allList;

  final String msg;

  const WareProState({
    this.status = WareProStatus.init,
    this.list = const [],
    this.allList = const [],
    this.msg = "",
  });

  WareProState copyWith({
    WareProStatus? status,
    List<WareProResponse>? list,
    List<WareProResponse>? allList,
    String? msg,
  }) {
    return WareProState(
      status: status ?? this.status,
      list: list ?? this.list,
      allList: allList ?? this.allList,
      msg: msg ?? this.msg,
    );
  }
}
