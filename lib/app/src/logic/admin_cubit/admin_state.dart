// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'admin_cubit.dart';

enum AdminSS { init, loading, success, fail }

class AdminState {
  final AdminSS status;
  final List<AdminRead> list;
  final String msg;
  final AdminRead? single;

  AdminState({
    required this.msg,
    required this.status,
    required this.list,
    this.single,
  });

  AdminState copyWith({
    AdminSS? status,
    List<AdminRead>? list,
    String? msg,
    AdminRead? single,
  }) {
    return AdminState(
      single: single ?? this.single,
      msg: msg ?? this.msg,
      status: status ?? this.status,
      list: list ?? this.list,
    );
  }
}
