import 'package:crm_app/app/utils/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FromToDate extends StatefulWidget {
  const FromToDate({super.key});

  @override
  State<FromToDate> createState() => _FromToDateState();
}

class _FromToDateState extends State<FromToDate> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  final _dateFormat = DateFormat('dd.MM.yyyy');

  Future<DateTime?> _pickDate(TextEditingController controller) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Select date',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // header color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        controller.text = _dateFormat.format(picked);
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomField(
          ctrl: _fromController,
          isDate: true,
          isStart: true,
          height: 80,
          width: 200,
          hint: "Start Date",
          onTap: () {
            _pickDate(_fromController).then((v) {
              setState(() {
                // context.read<OrderCubit>().setToDate(v);
              });
            });
          },
        ),
        CustomField(
          ctrl: _toController,
          isDate: true,
          height: 80,
          width: 200,
          hint: "End Date",
          onTap: () => _pickDate(_toController).then((v) {
            setState(() {
              // context.read<OrderCubit>().setToDate(v);
            });
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }
}
