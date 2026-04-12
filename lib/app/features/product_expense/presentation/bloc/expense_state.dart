part of 'expense_cubit.dart';

enum ProdStatus { init, loading, success, error, disconnected }

class ExpenseState {
  final ProdStatus status;
  final String msg;
  final ProductChanges changes;

  const ExpenseState({
    required this.changes,
    this.status = ProdStatus.init,
    this.msg = "",
  });

  ExpenseState copyWith({
    ProdStatus? status,
    String? msg,
    ProductChanges? changes,
  }) {
    return ExpenseState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      changes: changes ?? this.changes,
    );
  }
}
