import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class ClientForm extends StatelessWidget {
  const ClientForm({
    super.key,
    this.ctrl,
    required this.txt,
    this.labelTxt = "data",
    this.isPass = false,
    this.valid,
  });
  final TextEditingController? ctrl;
  final String txt;
  final String labelTxt;
  final bool isPass;
  final String? Function(String?)? valid;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt + ":",
          style: AppTextStyle.medium.copyWith(color: AppColour.white),
        ),
        SizedBox(
          height: 60,
          width: 360,
          child: TextFormField(
            validator: valid,
            controller: ctrl,
            decoration: InputDecoration(
              filled: true, // enables background color
              fillColor: AppColour.clTxtBg,
              hint: Text("Enter your " + txt),
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
          ),
        ),
      ],
    );
  }
}
