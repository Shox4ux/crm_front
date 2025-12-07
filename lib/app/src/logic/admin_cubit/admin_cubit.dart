// import 'package:crm_app/app/src/data/remote/models/request/admin_write.dart';
// import 'package:crm_app/app/src/data/remote/models/request/user/user_write.dart';
// import 'package:crm_app/app/src/data/remote/models/response/admin/admin_read.dart';
// import 'package:crm_app/app/src/data/remote/repos/base_repo/data_state.dart';
// import 'package:crm_app/app/src/data/remote/repos/repo/admin/admin_repo.dart';
// import 'package:crm_app/app/src/data/remote/repos/repo/user/user_repo.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'admin_state.dart';

// class AdminCubit extends Cubit<AdminState> {
//   final AdminRepo _repo;
//   final UserRepo _uRepo;

//   List<AdminRead> _filtList = [];

//   AdminCubit(this._repo, this._uRepo)
//     : super(AdminState(status: AdminSS.init, list: [], msg: "")) {
//     _getList();
//   }

//   List<AdminRead> getFiltList() => _filtList;

//   void filter(String query) {
//     if (query.isNotEmpty) {
//       _filtList = state.list
//           .where((c) => c.user.username.toLowerCase().contains(query))
//           .toList();
//     } else {
//       _filtList.clear();
//       _filtList = state.list;
//     }
//   }

//   void _getList() async {
//     emit(state.copyWith(status: AdminSS.loading));

//     _filtList.clear();

//     var res = await _repo.getAllAdmin();
//     if (res is DataSuccess) {
//       emit(state.copyWith(status: AdminSS.success, list: res.data));
//     } else if (res is DataFailed) {
//       emit(state.copyWith(status: AdminSS.fail, msg: res.errorMsg));
//     }
//     _filtList = state.list;
//   }

//   void createAdmin({required UserWrite body, required int permission}) async {
//     emit(state.copyWith(status: AdminSS.loading));

//     var uRes = await _uRepo.createUser(body: body);

//     if (uRes is DataSuccess) {
//       var res = await _repo.createAdmin(
//         body: AdminRequestModel(userId: uRes.data!.id, permission: permission),
//       );

//       if (res is DataSuccess) {
//         _getList();
//       } else if (res is DataFailed) {
//         emit(state.copyWith(status: AdminSS.fail, msg: res.errorMsg));
//       }
//     }
//   }

//   void deleteAdmin({required int id}) async {
//     emit(state.copyWith(status: AdminSS.loading));
//     var res = await _repo.deleteAdmin(id: id);
//     if (res is DataSuccess) {
//       _getList();
//     } else if (res is DataFailed) {
//       emit(state.copyWith(status: AdminSS.fail, msg: res.errorMsg));
//     }
//   }

//   void getAdminByUserId({required int userId}) async {
//     emit(state.copyWith(status: AdminSS.loading));
//     var res = await _repo.getAdminByUserId(userId: userId);
//     if (res is DataSuccess) {
//     } else if (res is DataFailed) {
//       emit(state.copyWith(status: AdminSS.fail, msg: res.errorMsg));
//     }
//   }
// }
