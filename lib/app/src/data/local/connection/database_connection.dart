import 'database_connection_native.dart'
    if (dart.library.js_interop) 'database_connection_web.dart';
import 'package:drift/drift.dart';

QueryExecutor openConnection() => createDriftConnection();
