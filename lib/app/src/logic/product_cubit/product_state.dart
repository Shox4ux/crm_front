// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

enum ProdStatus { init, loading, success, error, disconnected }

class ProductState {
  final ProdStatus status;
  final List<ProductRead> list;
  final String msg;
  final ProductChanges changes;

  const ProductState({
    required this.changes,
    this.status = ProdStatus.init,
    this.list = const [],
    this.msg = "",
  });

  ProductState copyWith({
    ProdStatus? status,
    List<ProductRead>? list,
    String? msg,
    ProductChanges? changes,
  }) {
    return ProductState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
      changes: changes ?? this.changes,
    );
  }
}
