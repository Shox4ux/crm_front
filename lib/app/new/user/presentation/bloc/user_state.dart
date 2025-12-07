// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

enum UserSStatus { error, loading, success, init }

class UserState {
  final UserEntity? vUser;
  final UserSStatus status;
  final String? msg;
  UserState({this.vUser, required this.status, this.msg});

  UserState copyWith({UserEntity? vUser, UserSStatus? status, String? msg}) {
    return UserState(
      vUser: vUser ?? this.vUser,
      status: status ?? this.status,
      msg: msg ?? this.msg,
    );
  }
}
