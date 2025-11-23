import '../../../models/request/client/client_prod_update.dart';
import '../../../models/request/client/client_update.dart';
import '../../../models/request/client/client_write.dart';
import '../../../models/response/client/client_read.dart';
import '../../../models/response/del_read.dart';
import '../../base_repo/base_repo.dart';
import '../../base_repo/data_state.dart';
import 'client_repo_impl.dart';
import '../../../service/api_service.dart';

class ClientRepo extends BaseRepo implements ClientRepoImpl {
  final ApiService _service;

  ClientRepo(this._service);
  @override
  Future<DataState<ClientWrite>> createClient({required ClientWrite body}) =>
      getStateOf<ClientWrite>(request: () => _service.createClient(body: body));

  @override
  Future<DataState<DelRead>> deleteClient({required int id}) =>
      getStateOf<DelRead>(request: () => _service.deleteClient(id: id));

  @override
  Future<DataState<List<ClientRead>>> getAllClient() =>
      getStateOf<List<ClientRead>>(request: () => _service.getAllClient());

  @override
  Future<DataState<ClientRead>> getClient({required int userId}) =>
      getStateOf<ClientRead>(
        request: () => _service.getClientById(userId: userId),
      );

  @override
  Future<DataState> updateCP({
    required int cpId,
    required ClientProdUpdate body,
  }) => getStateOf(
    request: () => _service.updateClientProd(cpId: cpId, body: body),
  );

  @override
  Future<DataState> updateClient({
    required int id,
    required ClientUpdate body,
  }) => getStateOf(
    request: () => _service.updateClient(id: id, body: body),
  );
}
