import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbar/search_app_bar.dart';
import '../../components/buttons/green_button_accessible.dart';
import '../../components/buttons/green_button_unaccessible.dart';
import '../../controllers/code_insert_page_controller.dart';
import '../login_complete/login_complete_page.dart';

class CodeInsertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CodeInsertPageController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SearchAppBar(),
            const Spacer(),
            Obx(() {
              return controller.seatNumber.value.isNotEmpty
                  ? Text(
                  controller.seatNumber.value,  // 입력값 o
                style: TextStyle(
                  fontSize: 50,
                ),
              )
                  : Text('');                   // 입력값 x
            }),
            const Spacer(),
            Obx(() {
              return (controller.seatNumber.value.isEmpty || controller.seatNumber.value == "존재하지 않는\n자리입니다")
                  ? GreenButtonUnaccessible()                                  // 입력값 x or 자리 x
                  : GreenButtonAccessible(text: '수동코드 입력', onPressed: () {  // 자리 o
                    Get.to(() => LoginCompletePage());
              });
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
