// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'client_cubit.dart';

enum ClientStatus { init, loading, empty, success, error }

class ClientState {
  final ClientStatus status;
  final List<ClientEntity> list;
  final String? msg;
  final ClientEntity? slctClient;

  ClientState({
    required this.status,
    required this.list,
    this.msg,
    this.slctClient,
  });

  ClientState copyWith({
    ClientStatus? status,
    List<ClientEntity>? list,
    String? msg,
    ClientEntity? slctClient,
  }) {
    return ClientState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
      slctClient: slctClient ?? this.slctClient,
    );
  }
}
