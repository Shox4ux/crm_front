import 'dart:io';
import 'package:crm_app/app/features/client/data/model/client_update.dart';
import 'package:crm_app/app/features/client/data/model/create_as_client.dart';
import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/client/presentation/widget/client_button.dart';
import 'package:crm_app/app/features/client/presentation/widget/client_order_table.dart';
import 'package:crm_app/app/features/client/presentation/widget/local_avatar.dart';
import 'package:crm_app/app/features/client/presentation/widget/remote_avatar.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/form_empty_validation.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:crm_app/app/utils/funcs/img_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' show basename;

class ClientAddEdit extends StatefulWidget {
  const ClientAddEdit({super.key, this.data, this.isEdit = false});
  final ClientEntity? data;
  final bool isEdit;

  @override
  State<ClientAddEdit> createState() => _ClientAddEditState();
}

class _ClientAddEditState extends State<ClientAddEdit> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameCtrl;
  late TextEditingController _passwCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _addressCtrl;
  bool isEditActive = false;

  List<String> get colist => [
    context.l10n.number,
    context.l10n.date,
    context.l10n.totalAmount,
    context.l10n.paidAmount,
    context.l10n.debt,
    context.l10n.status,
  ];
  // for image upload
  File? _image;
  MultipartFile? img;
  String? _initialUrl;

  void createMultipart() {
    if (_image == null) return;
    img = MultipartFile.fromFileSync(
      _image!.path,
      filename: basename(_image!.path),
    );
    nullImgUrl();
  }

  void nullImgUrl() => _initialUrl = null;

  Future pickImage() async {
    final pickedFile = await ImageHelper.imageHandler();
    if (pickedFile != null) {
      _image = await ImageHelper.compressAndSave(File(pickedFile.path));
      if (widget.isEdit) {
        createMultipart();
      }
      setState(() {});
    }
  }

  void _init() {
    if (widget.isEdit) {
      var data = widget.data;
      _nameCtrl = TextEditingController(text: data?.user.username);
      _passwCtrl = TextEditingController(text: "");
      _phoneCtrl = TextEditingController(text: data?.user.phone);
      _addressCtrl = TextEditingController(text: data?.user.address);
      _initialUrl = data?.user.img;
    } else {
      _nameCtrl = TextEditingController();
      _passwCtrl = TextEditingController();
      _phoneCtrl = TextEditingController();
      _addressCtrl = TextEditingController();
    }
    _formKey = GlobalKey<FormState>();
  }

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

  void createClient() {
    if (_formKey.currentState!.validate()) {
      createMultipart();
      var body = CreateAsClient(
        username: _nameCtrl.text,
        phone: _phoneCtrl.text,
        address: _addressCtrl.text,
        password: _passwCtrl.text,
        img: img,
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
      img: img,
      username: _nameCtrl.text,
      phone: _phoneCtrl.text,
      address: _addressCtrl.text,
      password: _passwCtrl.text,
      isActive: true, // for now we dont touch clients active status
    );
    context.read<ClientCubit>().updateClient(id: widget.data!.id, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? context.l10n.editClient : context.l10n.createClient,
        ),
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
                CustomTitle(title: context.l10n.clientInfo),
                BorderedContainer(
                  color: AppColour.clSecond,
                  borderColor: AppColour.clStroke,
                  padding: EdgeInsets.symmetric(vertical: 80),
                  borderRadius: AppRadius.tableRadius,
                  child: Column(
                    spacing: 50,
                    children: [
                      Column(
                        spacing: 12,
                        children: [
                          (_initialUrl != null && widget.isEdit)
                              ? RemoteAvatar(
                                  onTap: pickImage,
                                  url: _initialUrl!.fullUrl(),
                                )
                              : LocalAvatar(
                                  onTap: _image != null ? pickImage : null,
                                  image: _image,
                                ),
                          _image == null
                              ? TextButton(
                                  onPressed: pickImage,
                                  child: Text(context.l10n.chooseImage),
                                )
                              : SizedBox.shrink(),
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
                                      txt: context.l10n.username,
                                    ),
                                    CustomForm(
                                      ctrl: _passwCtrl,
                                      valid: validateNotEmpty,
                                      txt: context.l10n.password,
                                    ),
                                  ],
                                ),
                          Column(
                            spacing: 30,
                            children: [
                              CustomForm(
                                valid: validateNotEmpty,
                                txt: context.l10n.phone,
                                ctrl: _phoneCtrl,
                              ),
                              CustomForm(
                                ctrl: _addressCtrl,
                                valid: validateNotEmpty,
                                txt: context.l10n.address,
                              ),
                            ],
                          ),
                        ],
                      ),
                      BlocConsumer<ClientCubit, ClientState>(
                        listener: (context, state) {
                          if (state.status == ClientStatus.opsuccess) {
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
                                    ClientButton(
                                      onPress: delete,
                                      txt: context.l10n.delete,
                                    ),
                                    ClientButton(
                                      onPress: edit,
                                      txt: context.l10n.edit,
                                    ),
                                  ],
                                )
                              : ClientButton(
                                  onPress: createClient,
                                  txt: context.l10n.createClient,
                                );
                        },
                      ),
                    ],
                  ),
                ),
                CustomTitle(title: context.l10n.clientInvoice),
                BlocBuilder<ClientCubit, ClientState>(
                  builder: (context, state) {
                    var orders = state.slctClient?.orders;
                    if (orders == [] || orders == null) {
                      return SizedBox(height: 300, child: NoData());
                    }
                    return ClientOrderTable(clms: colist, rows: orders);
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
