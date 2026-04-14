import 'package:crm_app/actions/app_actions.dart';
import 'package:flutter/material.dart';

class EnterAction extends StatelessWidget {
  final Widget child;
  final VoidCallback onEnter;

  const EnterAction({super.key, required this.child, required this.onEnter});

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: {
        SubmitIntent: CallbackAction<SubmitIntent>(
          onInvoke: (intent) {
            onEnter();
            return null;
          },
        ),
      },
      child: KeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        child: Focus(autofocus: true, child: child),
      ),
    );
  }
}
