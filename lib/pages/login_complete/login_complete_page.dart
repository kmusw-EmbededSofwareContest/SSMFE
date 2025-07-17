import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studysmartmate/components/buttons/green_button_accessible.dart';
import 'package:studysmartmate/controllers/code_insert_page_controller.dart';

import '../login/login_page.dart';

class LoginCompletePage extends StatelessWidget {
  const LoginCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CodeInsertPageController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Text(
                "로그인을 완료했습니다!\n자리를 확인해주세요!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Expanded(  // 화면 중앙에 표시
              child: Center(
                child: Text(
                  controller.seatNumber.value,  // 자리 표시
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            GreenButtonAccessible(text: "다시 로그인하기", onPressed: () {
              controller.insertedValue.value = '';
              controller.seatNumber.value = '';       // 설정값 초기화
              Get.offAll(() => LoginPage());
            }),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
