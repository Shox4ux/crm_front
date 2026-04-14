import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SubmitIntent extends Intent {
  const SubmitIntent();
}

class PopIntent extends Intent {
  const PopIntent();
}

var actList = {
  LogicalKeySet(LogicalKeyboardKey.escape): const PopIntent(),
  LogicalKeySet(LogicalKeyboardKey.enter): const SubmitIntent(),
};
