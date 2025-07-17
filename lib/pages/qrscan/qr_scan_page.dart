import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../components/buttons/green_button_accessible.dart';
import '../../controllers/code_insert_page_controller.dart';
import '../code_insert/code_insert_page.dart';

class QrScanPage extends StatelessWidget {
  QrScanPage({super.key}) {
    Get.put(CodeInsertPageController());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.find<CodeInsertPageController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Spacer(flex: 1),
            Container(
              width: width * 0.77,
              height: height * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: MobileScanner(                   // QR 코드 패키지 실행
                  onDetect: controller.handleBarcode  // 함수는 controller
              ),
            ),

            Spacer(flex: 1),
            Text(
                'QR을 스캔해주세요!\n아니면, QR 코드 위에\n수동 코드를 입력해주세요!',
              style: TextStyle(
                fontSize: width * 0.08,
              ),
            ),
            Spacer(flex: 1),
            GreenButtonAccessible(
              text: '수동 코드 입력하기',
              onPressed: () {
                Get.to(() => CodeInsertPage());
              },),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
