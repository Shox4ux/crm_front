import 'package:json_annotation/json_annotation.dart';
part 'expense_create.g.dart';

@JsonSerializable()
class ExpenseCreate {
  final String name;
  final double amount;
  ExpenseCreate({required this.name, required this.amount});

  Map<String, dynamic> toJson() => _$ExpenseCreateToJson(this);
  factory ExpenseCreate.fromJson(Map<String, dynamic> map) =>
      _$ExpenseCreateFromJson(map);
}
