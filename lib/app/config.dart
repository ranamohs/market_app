
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





class Config {
  static const String BASE_URL = "";
  static String APP_VERSION = '0.0.0';
  static const String APP_NAME = 'Grocery-delivery';

  static initialConfigurations() async {
    WidgetsFlutterBinding.ensureInitialized();


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


  }
}
