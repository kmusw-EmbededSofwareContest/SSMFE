import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,  // 화면 세로 고정
  ]);
  runApp(const SmartStudyMate());
}

class SmartStudyMate extends StatelessWidget {
  const SmartStudyMate({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      theme: ThemeData(fontFamily: "LeeSeoYun"),  // 기본 폰트 설정
      debugShowCheckedModeBanner: false,
    );
  }
}