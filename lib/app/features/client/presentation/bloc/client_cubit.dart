import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/client/data/model/client_update.dart';
import 'package:crm_app/app/features/client/data/model/create_as_client.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/client/data/model/client_prod_update.dart';
import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/domain/repo/client_repo.dart';
part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  final ClientRepo _repo;

  late List<ClientEntity> _filtered;
  ClientCubit(this._repo)
    : super(ClientState(status: ClientStatus.init, list: [])) {
    _filtered = [];
    _getAllClient();
  }

  List<ClientEntity> getFiltList() => _filtered;

  void filter(String? query) {
    if (query != null && query.isNotEmpty) {
      _filtered = state.list
          .where((c) => c.user.username!.toLowerCase().contains(query))
          .toList();
    } else {
      _filtered.clear();
      _filtered = state.list;
    }
  }

  void _getAllClient() async {
    emit(state.copyWith(status: ClientStatus.loading));
    var res = await _repo.getAllClient();
    if (res is DataSuccess) {
      _filtered = res.data ?? [];
      emit(state.copyWith(status: ClientStatus.success, list: res.data));
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }

  void createClient({required CreateAsClient body}) async {
    emit(state.copyWith(status: ClientStatus.loading));
    final res = await _repo.createClient(body: body);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ClientStatus.success));
      _getAllClient();
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }

  void updateClient({required ClientUpdate body, required int id}) async {
    emit(state.copyWith(status: ClientStatus.loading));
    final res = await _repo.updateClient(id: id, body: body);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ClientStatus.success));
      _getAllClient();
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }

  void deleteClient(int id) async {
    emit(state.copyWith(status: ClientStatus.loading));
    var res = await _repo.deleteClient(id: id);
    if (res is DataSuccess) {
      _getAllClient();
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }

  void updateCP(String? val, int cpId, int uId) async {
    emit(state.copyWith(status: ClientStatus.loading));
    var res = await _repo.updateCP(
      cpId: cpId,
      body: ClientProdUpdate(customPrice: double.tryParse(val ?? "")),
    );
    if (res is DataSuccess) {
      _getClientByUid(uId);
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }

  void _getClientByUid(int id) async {
    emit(state.copyWith(status: ClientStatus.loading));
    var res = await _repo.getClient(userId: id);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ClientStatus.success, slctClient: res.data));
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }
}
