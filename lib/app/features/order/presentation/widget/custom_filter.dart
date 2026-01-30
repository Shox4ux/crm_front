import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/order/presentation/bloc/order_cubit.dart';
import 'package:crm_app/app/features/order/presentation/utils/filter_date_formatter.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CustomFilter extends StatefulWidget {
  const CustomFilter({super.key, required this.onFilterPressed});

  final void Function() onFilterPressed;

  @override
  State<CustomFilter> createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  final TextEditingController fromDateCtrl = TextEditingController();
  final TextEditingController toDateCtrl = TextEditingController();
  DateTime? fromDate;
  DateTime? toDate;
  OrderFilterStatus? selectedStatus = OrderFilterStatus.all;

  final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColour.backgroundDark, width: 1),
  );
  void filterOrders() {
    context.read<OrderCubit>().complexFilter(
      from: fromDate,
      to: toDate,
      status: selectedStatus,
    );
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: isFrom
          ? (fromDate ?? DateTime.now())
          : (toDate ?? DateTime.now()),
    );

    if (picked == null) return;

    setState(() {
      if (isFrom) {
        fromDate = picked;
        fromDateCtrl.text = _dateFormatter.format(picked);
      } else {
        toDate = picked;
        toDateCtrl.text = _dateFormatter.format(picked);
      }
    });
  }

  void _applyManualDateEdit() {
    fromDate = parseDate(fromDateCtrl.text);
    toDate = parseDate(toDateCtrl.text);
  }

  void _resetFilters() {
    setState(() {
      fromDate = null;
      toDate = null;
      selectedStatus = OrderFilterStatus.all;
      fromDateCtrl.clear();
      toDateCtrl.clear();
    });
    context.read<OrderCubit>().filterResets();
    widget.onFilterPressed();
  }

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      borderRadius: AppRadius.filterRadius,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              filterOrders();
              widget.onFilterPressed();
            },
            child: FilterItem(img: SvgPicture.asset(AppAssets.filter)),
          ),
          SizedBox(
            width: 280,
            child: TextField(
              controller: fromDateCtrl,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: border,
                labelText: 'From date',
                hintText: 'dd.MM.yyyy',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () => _pickDate(isFrom: true),
              onChanged: (_) => _applyManualDateEdit(),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 280,
            child: TextField(
              controller: toDateCtrl,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: border,

                labelText: 'To date',
                hintText: 'dd.MM.yyyy',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () => _pickDate(isFrom: false),
              onChanged: (_) => _applyManualDateEdit(),
            ),
          ),
          const SizedBox(width: 12),

          SizedBox(
            width: 280,
            child: DropdownButtonFormField<OrderFilterStatus>(
              initialValue: selectedStatus,
              decoration: InputDecoration(labelText: 'Status', border: border),
              items: OrderFilterStatus.values
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                  .toList(),
              onChanged: (v) => setState(() {
                selectedStatus = v;
              }),
            ),
          ),
          FilterItem(
            img: GestureDetector(
              onTap: () {
                _resetFilters();
                widget.onFilterPressed();
              },
              child: Row(
                spacing: 5,
                children: [
                  SvgPicture.asset(AppAssets.returnIcon, height: 20, width: 20),
                  Text(
                    "Reset filter",
                    style: AppTxtStl.medium.copyWith(
                      color: AppColour.dashPending,
                    ),
                  ),
                ],
              ),
            ),
            isEnd: true,
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, this.txt, this.isEnd = false, this.img});
  final String? txt;
  final bool isEnd;
  final Widget? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        border: Border(
          right: !isEnd ? BorderSide(color: AppColour.stroke) : BorderSide.none,
        ),
      ),
      child:
          img ??
          Text(
            txt ?? "",
            style: AppTxtStl.medium.copyWith(color: AppColour.white),
          ),
    );
  }
}
