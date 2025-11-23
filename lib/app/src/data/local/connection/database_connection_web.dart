import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

QueryExecutor createDriftConnection() {
  return LazyDatabase(() async {
    // Use the new WASM-based web storage
    final db = await WasmDatabase.open(
      databaseName: 'app_db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'), // Required for WASM
      driftWorkerUri: Uri.parse(
        'drift_worker.dart.js',
      ), // Optional: for multi-threading
    );
    return db.resolvedExecutor;
  });
}
