import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../pages/login_complete/login_complete_page.dart';

class CodeInsertPageController extends GetxController {
  Rx<bool> isLoading = false.obs;

  Rx<String> insertedValue = ''.obs;

  Rx<String> lastScannedCode = ''.obs;
  Rx<DateTime> lastScannedTime = DateTime.now().obs;

  Rx<String> seatNumber = ''.obs;

  // TODO: 검색 API 연결

  @override
  void onInit() {
    super.onInit();
    insertedValue.listen((_) => checkInsertedValue());
  }

  void updateInsertedValue(String value) {
    insertedValue.value = value;
  }

  void handleBarcode(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    final now = DateTime.now();

    for (final barcode in barcodes) {
      final String? code = barcode.rawValue;

      //중복 방지 코드
      if (code != null) {
        if (code == lastScannedCode.value &&                                  // 스캔한 코드가 가장 최근에 스캔한 코드와 동일
            now.difference(lastScannedTime.value) < Duration(seconds: 3)) {   // 스캔한 지 3초가 지나지 않음
          return;  // 스캔 x
        }

        lastScannedCode.value = code;
        lastScannedTime.value = now;

        if (code == 'https://qr-codes.io/bUyiXk') {  // 우선 지정한 QR 코드만 가능
          seatNumber.value = '임태근바보';
          Get.to(() => LoginCompletePage());
        } else {
          Get.snackbar("지원하지 않는 QR 코드입니다", "QR 코드 확인 후 다시 스캔 해주세요!");
        }

        break;
      }
    }
  }

  void checkInsertedValue() {
    isLoading.value = true;
    try {
      if (insertedValue.value == '임태근바보') {  // insertValue 가 DB 에 존재
        seatNumber.value = '임태근바보';
      } else if (insertedValue.value == "") {  // 아무런 입력 값이 없을 경우
        seatNumber.value = '';
      } else {                                 // insertValue 가 DB 에 존재 x
        seatNumber.value = '존재하지 않는\n자리입니다';
      }
    } catch (e) {
      Get.snackbar('코드 입력 오류', "입력하신 코드가 없습니다\n한 번 더 확인 해주세요!");
    } finally {
      isLoading.value = false;
    }
  }
}