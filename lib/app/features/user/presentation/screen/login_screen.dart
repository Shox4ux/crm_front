import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/user/data/model/login_request.dart';
import 'package:crm_app/app/features/user/presentation/bloc/user_cubit.dart';
import 'package:crm_app/app/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameCtrl;
  late TextEditingController _passwCtrl;

  @override
  void initState() {
    _nameCtrl = TextEditingController();
    _passwCtrl = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      var data = LoginRequest(
        role: 1,
        username: _nameCtrl.text,
        password: _passwCtrl.text,
      );
      context.read<UserCubit>().login(body: data);
    }
  }

  String? validateNotEmpty(String? value, {bool isPass = false}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 26, 39),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.status == UserSStatus.login) {
            context.go(Routes.home);
          }
          if (state.status == UserSStatus.error) {
            showToast(context, state.msg ?? "");
          }
        },
        child: Center(
          child: BorderedContainer(
            color: AppColour.backgroundDark,
            borderRadius: AppRadius.buttonRadius,
            padding: EdgeInsets.only(
              left: 120,
              right: 120,
              top: 90,
              bottom: 70,
            ),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  CustomTitle(title: "CRM Login"),
                  SizedBox(height: 40),
                  Column(
                    spacing: 12,
                    children: [
                      CustomForm(
                        valid: validateNotEmpty,
                        ctrl: _nameCtrl,
                        txt: "Secret Word",
                      ),
                      CustomForm(
                        valid: validateNotEmpty,
                        ctrl: _passwCtrl,
                        isPass: true,
                        txt: "Password",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state.status == UserSStatus.loading) {
                        return SizedBox(width: 200, child: CustomLoading());
                      }
                      return CustomBtn(onPressed: _login, txt: "Login");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
