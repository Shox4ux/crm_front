import 'package:crm_app/app/features/client/data/model/client_update.dart';
import 'package:crm_app/app/features/client/data/model/create_as_client.dart';
import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/client/presentation/widget/client_button.dart';
import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/form_empty_validation.dart';
import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/home/presentation/widget/custom_data_table.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ClientAddEdit extends StatefulWidget {
  const ClientAddEdit({super.key, this.data, this.isEdit = false});
  final ClientEntity? data;
  final bool isEdit;

  @override
  State<ClientAddEdit> createState() => _ClientAddEditState();
}

class _ClientAddEditState extends State<ClientAddEdit> {
  void _init() {
    if (widget.isEdit) {
      var data = widget.data;
      _nameCtrl = TextEditingController(text: data?.user.username);
      _passwCtrl = TextEditingController(text: "");
      _phoneCtrl = TextEditingController(text: data?.user.phone);
      _addressCtrl = TextEditingController(text: data?.user.address);
    } else {
      _nameCtrl = TextEditingController();
      _passwCtrl = TextEditingController();
      _phoneCtrl = TextEditingController();
      _addressCtrl = TextEditingController();
    }
    _formKey = GlobalKey<FormState>();
  }

  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameCtrl;
  late TextEditingController _passwCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _addressCtrl;

  bool isEditActive = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void add() {
    if (_formKey.currentState!.validate()) {
      var body = CreateAsClient(
        username: _nameCtrl.text,
        phone: _phoneCtrl.text,
        address: _addressCtrl.text,
        password: _passwCtrl.text,
      );
      context.read<ClientCubit>().createClient(body: body);
    }
  }

  void delete() {
    showDelConfrm(
      ctx: context,
      action: () {
        context.read<ClientCubit>().deleteClient(widget.data!.id);
        goBack(context);
      },
    );
  }

  void edit() {
    var body = ClientUpdate(
      img: null,
      username: _nameCtrl.text,
      phone: _phoneCtrl.text,
      address: _addressCtrl.text,
      password: _passwCtrl.text,
      isActive: isEditActive,
    );
    context.read<ClientCubit>().updateClient(id: widget.data!.id, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Edit Client" : "Create Client"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        alignment: Alignment.topCenter,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(title: "Client Info"),
                BorderedContainer(
                  color: AppColour.clSecond,
                  borderColor: AppColour.clStroke,
                  padding: EdgeInsets.symmetric(vertical: 80),
                  borderRadius: AppRadius.tableRadius,
                  child: Column(
                    spacing: 50,
                    children: [
                      Column(
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColour.avatarBg,
                            radius: 40,
                            child: SvgPicture.asset(AppAssets.camera),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Choose Image"),
                          ),
                        ],
                      ),

                      Row(
                        spacing: widget.isEdit ? 0 : 80,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.isEdit
                              ? SizedBox.shrink()
                              : Column(
                                  spacing: 30,
                                  children: [
                                    CustomForm(
                                      ctrl: _nameCtrl,
                                      valid: validateNotEmpty,
                                      txt: "Username",
                                    ),
                                    CustomForm(
                                      ctrl: _passwCtrl,
                                      valid: validateNotEmpty,
                                      txt: "Password",
                                    ),
                                  ],
                                ),
                          Column(
                            spacing: 30,
                            children: [
                              !widget.isEdit
                                  ? SizedBox.shrink()
                                  : CustomForm(
                                      ctrl: _nameCtrl,
                                      valid: validateNotEmpty,
                                      txt: "Username",
                                    ),
                              CustomForm(
                                valid: validateNotEmpty,
                                txt: "Phone",
                                ctrl: _phoneCtrl,
                              ),
                              CustomForm(
                                ctrl: _addressCtrl,
                                valid: validateNotEmpty,
                                txt: "Address",
                              ),
                            ],
                          ),
                        ],
                      ),
                      BlocConsumer<ClientCubit, ClientState>(
                        listener: (context, state) {
                          if (state.status == ClientStatus.success) {
                            goBack(context);
                          }
                        },
                        builder: (context, state) {
                          if (state.status == ClientStatus.loading) {
                            return CustomLoading();
                          }
                          return widget.isEdit
                              ? Row(
                                  spacing: 50,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClientButton(onPress: edit, txt: "Edit"),
                                    ClientButton(
                                      onPress: delete,
                                      txt: "Delete",
                                    ),
                                  ],
                                )
                              : ClientButton(onPress: add, txt: "Add Now");
                        },
                      ),
                    ],
                  ),
                ),
                CustomTitle(title: "Client Invoice"),
                BlocBuilder<ClientCubit, ClientState>(
                  builder: (context, state) {
                    return CustomTable(
                      columns: ["Name", "Age", "Address"],
                      rows: [
                        ["John Doe", "30", "123 Main St"],
                        ["Jane Smith", "25", "456 Oak Ave"],
                        ["Sam Johnson", "40", "789 Pine Rd"],
                      ],
                    );
                  },
                ),
                CustomFooter(totalCount: 12, pageCount: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
