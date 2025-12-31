import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    this.ctrl,
    this.txt,
    this.isPass = false,
    this.valid,
    this.readOnly = false,
    this.onChanged,
    this.prefix,
    this.withLabel = true,
    this.initVal,
  });
  final TextEditingController? ctrl;
  final String? txt;
  final bool isPass;
  final bool withLabel;
  final String? Function(String?)? valid;
  final void Function(String?)? onChanged;
  final bool readOnly;
  final String? prefix;
  final String? initVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withLabel
            ? Text(
                "$txt:",
                style: AppTextStyle.medium.copyWith(color: AppColour.white),
              )
            : SizedBox.shrink(),
        SizedBox(
          height: 60,
          width: 360,
          child: TextFormField(
            initialValue: initVal,
            readOnly: readOnly,
            onChanged: onChanged,
            validator: valid,
            controller: ctrl,

            decoration: InputDecoration(
              filled: true, // enables background color
              fillColor: AppColour.clTxtBg,
              hint: Text("Enter $txt"),
              prefixText: prefix,
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
