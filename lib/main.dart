import 'package:calendar_events/screens/main_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/app_theme_input_dec.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calender App',
        theme: AppTheme.data(),
        home: const CalendarApp(),
      );
    });
  }
}
