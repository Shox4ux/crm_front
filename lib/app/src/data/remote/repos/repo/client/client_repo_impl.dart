import 'package:crm_app/app/new/common/data/repo/data_state.dart';

import '../../../models/request/client/client_prod_update.dart';
import '../../../models/request/client/client_update.dart';
import '../../../models/request/client/client_write.dart';
import '../../../models/response/client/client_read.dart';
import '../../../models/response/del_read.dart';

abstract class ClientRepoImpl {
  Future<DataState<ClientWrite>> createClient({required ClientWrite body});
  Future<DataState<DelRead>> deleteClient({required int id});
  Future<DataState<List<ClientRead>>> getAllClient();
  Future<DataState<ClientRead>> getClient({required int userId});

  Future<DataState<dynamic>> updateClient({
    required int id,
    required ClientUpdate body,
  });
  Future<DataState<dynamic>> updateCP({
    required int cpId,
    required ClientProdUpdate body,
  });
}
