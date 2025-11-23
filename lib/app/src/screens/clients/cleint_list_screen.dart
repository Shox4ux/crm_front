import 'package:crm_app/app/src/data/remote/models/request/client/client_write.dart';
import 'package:crm_app/app/src/data/remote/models/request/user/user_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/client/client_read.dart';
import 'package:crm_app/app/utils/funcs/del_confrm.dart';
import 'package:crm_app/app/utils/funcs/show_toast.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../logic/logic.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _passwCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _addressCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _passwCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            CustomSearchAdd(
              onSearch: (val) {
                setState(() {
                  context.read<ClientCubit>().filter(val);
                });
              },
              onAdd: () {
                showAddClient(
                  context,
                  _nameCtrl,
                  _passwCtrl,
                  _phoneCtrl,
                  _addressCtrl,
                );
              },
              btnTxt: "Add Client",
            ),
            BlocConsumer<ClientCubit, ClientState>(
              listener: (context, state) {
                if (state.status == ClientStatus.error) {
                  showToast(context, state.msg ?? "");
                }
              },
              builder: (context, state) {
                if (state.status == ClientStatus.loading) {
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                var list = context.read<ClientCubit>().getFiltList();
                if (list.isEmpty) {
                  return Expanded(child: Center(child: Text("No Data Found")));
                }

                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                    ),
                    itemCount: list.length,
                    itemBuilder: (_, int i) => Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ClientCard(client: list[i]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showAddClient(
  BuildContext c,
  TextEditingController nameCtrl,
  TextEditingController passwCtrl,
  TextEditingController phoneCtrl,
  TextEditingController addressCtrl,
) {
  showDialog(
    context: c,
    barrierDismissible: false, // user must tap Confirm or Cancel
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Center(child: const Text('Enter Details')),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomField(
              isDense: false,
              ctrl: nameCtrl,
              hint: "Name",
              width: 300,
              height: 60,
            ),
            CustomField(
              isDense: false,
              ctrl: passwCtrl,
              hint: "Password",
              width: 300,
              height: 60,
            ),
            CustomField(
              isDense: false,
              ctrl: phoneCtrl,
              hint: "Phone",
              width: 300,
              height: 60,
            ),
            CustomField(
              isDense: false,
              ctrl: addressCtrl,
              hint: "Address",
              width: 300,
              height: 60,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          CustomBtn(
            txt: 'Confirm',
            width: 120,
            onPressed: () {
              context.read<ClientCubit>().createClient(
                cbody: ClientWrite(
                  phone: phoneCtrl.text,
                  address: addressCtrl.text,
                ),
                ubody: UserWrite(
                  hashedPassword: "",
                  username: nameCtrl.text,
                  password: passwCtrl.text,
                  role: 0,
                ),
              );
              nameCtrl.clear();
              addressCtrl.clear();
              phoneCtrl.clear();
              passwCtrl.clear();
              context.pop();
            },
          ),
          CustomBtn(
            txt: 'Cancel',
            width: 120,
            onPressed: () {
              nameCtrl.clear();
              addressCtrl.clear();
              context.pop();
            },
          ),
        ],
      );
    },
  );
}

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.client});
  final ClientRead client;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            context.read<ClientCubit>().onClientPressed(client);
            context.push("/client_info");
          },
          child: Card(
            elevation: 8,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(client.user.username), Text(client.phone)],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () {
              showDelConfrm(context, () {
                context.pop();
                context.read<ClientCubit>().deleteClient(client.id);
              });
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
