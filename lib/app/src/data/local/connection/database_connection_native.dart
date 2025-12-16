import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

QueryExecutor createDriftConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'app_db.sqlite');
    return NativeDatabase(File(path));
  });
}

int getTotal(List<int> d) {
  int total = 0;
  for (int i = 0; i < d.length; i++) {
    total += d[i];
  }
  return total;
}
