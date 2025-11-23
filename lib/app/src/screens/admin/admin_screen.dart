import 'package:crm_app/app/src/data/remote/models/request/user/user_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/admin/admin_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/enums/admin_permission.dart';
import 'package:crm_app/app/utils/enums/user_role.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late TextEditingController _unameCtrl;
  late TextEditingController _passwCtrl;

  @override
  void initState() {
    _unameCtrl = TextEditingController();
    _passwCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomSearchAdd(
              onSearch: (val) {
                setState(() {
                  context.read<AdminCubit>().filter(val);
                });
              },
              onAdd: () {
                addEditDialog(context, _unameCtrl, _passwCtrl);
              },
              btnTxt: "Add Ware",
            ),

            Flexible(
              child: BlocConsumer<AdminCubit, AdminState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.status == AdminSS.loading) {
                    return CusProgress();
                  }

                  var list = context.watch<AdminCubit>().getFiltList();
                  if (list.isEmpty) return Center(child: Text("data"));
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                    itemCount: list.length,
                    itemBuilder: (_, int i) => AdminCard(admin: list[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void addEditDialog(
  BuildContext c,
  TextEditingController unameCtrl,
  TextEditingController passwCtrl,
) {
  showDialog(
    context: c,
    barrierDismissible: false, // user must tap Confirm or Cancel
    builder: (context) {
      AdminPermission? slctdPermission;
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Enter Details'),
        content: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomField(
              width: 200,
              ctrl: unameCtrl,
              hint: "Username",
              isDense: false,
            ),
            CustomField(
              width: 200,
              ctrl: passwCtrl,
              hint: "Password",
              isDense: false,
            ),
            PermissionDrop(
              slctdVal: slctdPermission,
              onChanged: (val) => slctdPermission = val,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          CustomBtn(
            txt: 'Confirm',
            onPressed: () {
              var body = UserWrite(
                username: unameCtrl.text,
                password: passwCtrl.text,
                role: UserRole.admin.index,
              );

              context.read<AdminCubit>().createAdmin(
                body: body,
                permission: slctdPermission?.index ?? 0,
              );

              context.pop();
            },
          ),
          CustomBtn(
            txt: 'Cancel',
            onPressed: () {
              slctdPermission = null;
              unameCtrl.clear();
              passwCtrl.clear();
              context.pop();
            },
          ),
        ],
      );
    },
  );
}

class AdminCard extends StatelessWidget {
  const AdminCard({super.key, required this.admin});
  final AdminRead admin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.go("/product");
      },
      child: Card(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(admin.user.username),
              Text(AdminPermission.values[admin.permission].name),
            ],
          ),
        ),
      ),
    );
  }
}
