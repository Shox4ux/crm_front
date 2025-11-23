import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.ctrl,
    this.action,
    this.hint = "",
    this.width = 120,
    this.height = 50,
    this.isDense = true,
    this.isMoney = false,
    this.isStart = false,
    this.isDate = false,
    this.isActive = true,
    this.onlyRead = false,
    this.onTap,
  });
  final TextEditingController ctrl;
  final void Function(String)? action;
  final String hint;
  final double width;
  final double height;
  final bool isDense;
  final bool isDate;
  final bool onlyRead;
  final isStart;
  final bool isMoney;
  final bool isActive;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: TextField(
        onTap: onTap,
        onChanged: action,
        controller: ctrl,
        readOnly: onlyRead,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIcon: isDate ? Icon(Icons.calendar_today) : null,

          suffixText: isMoney ? " \$" : null,
          contentPadding: EdgeInsets.all(8),
          labelText: hint,
          isDense: isDense,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
