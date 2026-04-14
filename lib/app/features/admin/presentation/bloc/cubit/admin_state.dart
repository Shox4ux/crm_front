part of 'admin_cubit.dart';

enum AdminStateStatus { init, loading, error, success }

class AdminState extends Equatable {
  const AdminState({this.status = AdminStateStatus.init, this.admin, this.msg});
  final AdminStateStatus status;
  final AdminResponse? admin;
  final String? msg;

  AdminState copyWith({
    AdminStateStatus? status,
    AdminResponse? admin,
    String? msg,
  }) => AdminState(
    status: status ?? this.status,
    admin: admin ?? this.admin,
    msg: msg ?? this.msg,
  );
  @override
  List<Object> get props => [status];
}
