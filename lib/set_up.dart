import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await DIService.init();
}