import 'package:crm_app/app/src/data/remote/models/request/auth_write.dart';
import 'package:crm_app/app/src/logic/user_cubit/user_cubit.dart';
import 'package:crm_app/app/utils/funcs/show_toast.dart';
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
      var data = AuthWrite(
        role: 1,
        username: _nameCtrl.text,
        password: _passwCtrl.text,
      );
      context.read<UserCubit>().login(body: data);
    }
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
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.status == UserSStatus.success) {
            context.go('/main');
          }
          if (state.status == UserSStatus.error) {
            showToast(context, state.msg ?? "");
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: 345,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "CRM Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(
                        labelText: "Secret Word",
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter secret word"
                          : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwCtrl,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter password"
                          : null,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state.status == UserSStatus.loading) {
                          return CusProgress();
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
      ),
    );
  }
}
