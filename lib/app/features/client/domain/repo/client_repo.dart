import 'package:crm_app/app/features/client/data/model/client_prod_update.dart';
import 'package:crm_app/app/features/client/data/model/client_response.dart';
import 'package:crm_app/app/features/client/data/model/client_update.dart';
import 'package:crm_app/app/features/client/data/model/create_as_client.dart';
import 'package:crm_app/app/features/client/data/repo/client_repo_impl.dart';
import 'package:crm_app/app/features/client/data/source/client_api_service.dart';
import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';

class ClientRepo extends BaseRepo implements ClientRepoImpl {
  final ClientApiService _service;

  ClientRepo(this._service);
  @override
  Future<DataState<dynamic>> createClient({required CreateAsClient body}) =>
      getStateOf(request: () => _service.createClient(body: body));

  @override
  Future<DataState<dynamic>> deleteClient({required int id}) =>
      getStateOf(request: () => _service.deleteClient(id: id));

  @override
  Future<DataState<List<ClientResponse>>> getAllClient() =>
      getStateOf<List<ClientResponse>>(request: () => _service.getAllClient());

  @override
  Future<DataState<ClientResponse>> getClient({required int userId}) =>
      getStateOf<ClientResponse>(
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
