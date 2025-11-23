import '../../app_database.dart';

class WarehouseWithProducts {
  final WarehouseTable warehouse;
  final List<WarehouseProductTable> products;

  WarehouseWithProducts({required this.warehouse, required this.products});
}
