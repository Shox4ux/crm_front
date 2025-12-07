import 'package:crm_app/app/features/client/data/model/client_create.dart';
import 'package:crm_app/app/features/client/data/model/client_prod_update.dart';
import 'package:crm_app/app/features/client/data/model/client_response.dart';
import 'package:crm_app/app/features/client/data/model/client_update.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';

abstract class ClientRepoImpl {
  Future<DataState<dynamic>> createClient({required ClientCreate body});
  Future<DataState<dynamic>> deleteClient({required int id});
  Future<DataState<List<ClientResponse>>> getAllClient();
  Future<DataState<ClientResponse>> getClient({required int userId});
  Future<DataState<dynamic>> updateClient({
    required int id,
    required ClientUpdate body,
  });

  Future<DataState<dynamic>> updateCP({
    required int cpId,
    required ClientProdUpdate body,
  });
}
