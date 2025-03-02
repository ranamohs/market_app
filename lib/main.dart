import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/config.dart';

void main() async {
  await Config.initialConfigurations();
  runApp(const App());
}

