part of 'product_cubit.dart';

enum ProdStatus {
  init,
  loading,
  success,
  error,
  disconnected,
  empty,
  retriable,
}

class ProductState {
  final ProdStatus status;
  final List<ProductEntity> list;
  final String msg;
  final ProductChanges changes;
  final VoidCallback? retry;

  const ProductState({
    required this.changes,
    this.status = ProdStatus.init,
    this.list = const [],
    this.msg = "",
    this.retry,
  });

  ProdStatus isEmpty(List<ProductEntity>? list) {
    if (list == null || list.isEmpty) {
      return ProdStatus.empty;
    } else {
      return ProdStatus.success;
    }
  }

  ProductState copyWith({
    ProdStatus? status,
    List<ProductEntity>? list,
    String? msg,
    ProductChanges? changes,
    VoidCallback? retry,
  }) {
    return ProductState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
      changes: changes ?? this.changes,
      retry: retry ?? this.retry,
    );
  }
}
