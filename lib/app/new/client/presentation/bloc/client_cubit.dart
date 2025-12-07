import 'package:bloc/bloc.dart';
import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/new/user/data/model/user_create.dart';
import 'package:crm_app/app/new/client/data/model/client_create.dart';
import 'package:crm_app/app/new/client/data/model/client_prod_update.dart';
import 'package:crm_app/app/new/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/new/client/domain/repo/client_repo.dart';
import 'package:crm_app/app/new/user/domain/repo/user_repo.dart';
part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  final ClientRepo _repo;
  final UserRepo _urepo;

  late List<ClientEntity> _filtered;
  ClientCubit(this._repo, this._urepo)
    : super(ClientState(status: ClientStatus.init, list: [])) {
    _filtered = [];
    _getAllClient();
  }

  List<ClientEntity> getFiltList() => _filtered;

  void filter(String? query) {
    if (query != null && query.isNotEmpty) {
      _filtered = state.list
          .where((c) => c.user.username.toLowerCase().contains(query))
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

  void createClient({ClientCreate? cbody, UserCreate? ubody}) async {
    emit(state.copyWith(status: ClientStatus.loading));

    var res = await _urepo.createUser(body: ubody!);
    if (res is DataSuccess) {
      _createActualClient(cbody!.copyWith(userId: res.data?.id));
    } else {
      emit(state.copyWith(status: ClientStatus.error, msg: res.errorMsg));
    }
  }

  void _createActualClient(ClientCreate cbody) async {
    emit(state.copyWith(status: ClientStatus.loading));

    var res = await _repo.createClient(body: cbody);
    if (res is DataSuccess) {
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

  void onClientPressed(ClientEntity client) =>
      emit(state.copyWith(slctClient: client));
}
