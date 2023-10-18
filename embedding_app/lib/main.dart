import 'package:embedding_app/page/control_panel.dart';
import 'package:embedding_app/page/crop_information.dart';
import 'package:embedding_app/page/dashboard_screen.dart';
import 'package:embedding_app/page/login_screen.dart';
import 'package:embedding_app/page/setting_auto.dart';
import 'package:embedding_app/page/setting_auto_light.dart';
import 'package:embedding_app/page/setting_auto_water.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "/login":(context) => const LoginScreen(),
        "/dashboard":(context) => const DashboardScreen(),
        "/cropinformation":(context) => const CropInformation(),
        "/controlpanel":(context) => const ControlPanel(),
        "/settingautomatic":(context) => const SettingAutomatic(),
        "/autolight":(context) => const AutoLight(),
        "/autowater":(context) => const AutoWater(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
  
}

