part of 'product_cubit.dart';

enum ProdStatus { init, success, empty, error }

class ProductState {
  final String? msg;
  final ProdStatus status;
  final List<ProductEntity>? list;

  ProductState({this.msg, required this.status, this.list});

  ProductState copyWith({
    String? msg,
    ProdStatus? status,
    List<ProductEntity>? list,
  }) {
    return ProductState(
      msg: msg ?? this.msg,
      status: status ?? this.status,
      list: list ?? this.list,
    );
  }
}
