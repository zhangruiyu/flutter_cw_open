import 'package:flutter/material.dart';

extension NavigatorBuildContext on BuildContext {
  void pop<T extends Object>([T result]) {
    Navigator.pop<T>(this, result);
  }
}
