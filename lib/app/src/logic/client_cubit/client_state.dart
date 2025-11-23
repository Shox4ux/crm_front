// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'client_cubit.dart';

enum ClientStatus { init, loading, success, error }

class ClientState {
  final ClientStatus status;
  final List<ClientRead> list;
  final String? msg;
  final ClientRead? slctClient;

  ClientState({
    required this.status,
    required this.list,
    this.msg,
    this.slctClient,
  });

  ClientState copyWith({
    ClientStatus? status,
    List<ClientRead>? list,
    String? msg,
    ClientRead? slctClient,
  }) {
    return ClientState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
      slctClient: slctClient ?? this.slctClient,
    );
  }
}
