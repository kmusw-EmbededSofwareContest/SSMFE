import 'package:get/get.dart';

import '../pages/qrscan/qr_scan_page.dart';

class LoginPageController extends GetxController {
  var isLoading = false.obs;

  Future<void> kakaoLogin() async {
    isLoading.value = true;
    try {
      //TODO: 카카오 로그인 실행
      Get.offAll(() => QrScanPage());
    } catch (e) {
      Get.snackbar("로그인 실패", "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }
}