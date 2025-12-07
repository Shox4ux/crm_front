import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    this.ctrl,
    this.txt = "",
    this.valid,
    this.withLabel = false,
    this.isPass = false,
  });

  final TextEditingController? ctrl;
  final String txt;
  final bool withLabel;
  final bool isPass;
  final String? Function(String?)? valid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 360,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColour.textFieldBgLight,
        decoration: InputDecoration(
          hint: Text(txt),
          filled: true, // enables background color
          fillColor: AppColour.clTxtBg,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColour.clStroke, // stroke color when not focused
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColour.secondaryDark, // stroke color when focused
              width: 1.5,
            ),
          ),
          errorStyle: TextStyle(
            height: 0, // removes vertical space
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red, // stroke color on error
              width: 1.2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.redAccent, // focused + error
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColour.clStroke),
          ),
        ),
        controller: ctrl,
        obscureText: isPass,
        validator: valid,
      ),
    );
  }
}
