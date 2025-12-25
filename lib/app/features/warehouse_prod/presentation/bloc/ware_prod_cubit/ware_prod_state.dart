part of 'ware_prod_cubit.dart';

enum WareProdStatus { init, loading, success, error }

class WareProdState {
  final WareProdStatus status;
  final List<WareProResponse> list;
  final String msg;

  const WareProdState({
    this.status = WareProdStatus.init,
    this.list = const [],
    this.msg = "",
  });

  WareProdState copyWith({
    WareProdStatus? status,
    List<WareProResponse>? list,
    String? msg,
  }) {
    return WareProdState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
    );
  }
}
