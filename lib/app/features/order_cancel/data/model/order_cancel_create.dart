// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_cancel_create.g.dart';

@JsonSerializable()
class OrderCancelCreate extends Equatable {
  final int? orderId;
  final String cancelReason;
  final int cancelType;
  final int? cancelerId;

  const OrderCancelCreate({
    this.orderId,
    required this.cancelReason,
    required this.cancelType,
    this.cancelerId,
  });

  Map<String, dynamic> toJson() => _$OrderCancelCreateToJson(this);

  factory OrderCancelCreate.fromJson(Map<String, dynamic> json) =>
      _$OrderCancelCreateFromJson(json);

  @override
  List<Object?> get props => [orderId];

  OrderCancelCreate copyWith({
    int? orderId,
    String? cancelReason,
    int? cancelType,
    int? cancelerId,
  }) {
    return OrderCancelCreate(
      orderId: orderId ?? this.orderId,
      cancelReason: cancelReason ?? this.cancelReason,
      cancelType: cancelType ?? this.cancelType,
      cancelerId: cancelerId ?? this.cancelerId,
    );
  }
}
