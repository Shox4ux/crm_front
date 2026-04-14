import 'package:crm_app/app/features/admin/data/model/admin_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_cancel_response.g.dart';

@JsonSerializable()
class OrderCancelResponse extends Equatable {
  final int id;
  final String cancelReason;
  final int cancelType;
  final AdminResponse canceler;
  final DateTime createdAt;

  const OrderCancelResponse({
    required this.id,
    required this.cancelReason,
    required this.cancelType,
    required this.canceler,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$OrderCancelResponseToJson(this);
  factory OrderCancelResponse.fromJson(Map<String, dynamic> map) =>
      _$OrderCancelResponseFromJson(map);

  @override
  List<Object?> get props => [id];
}
