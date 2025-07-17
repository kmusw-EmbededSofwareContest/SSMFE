import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studysmartmate/components/text_fields/search_code_textfield.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();      // 뒤로 갈 경우 키보드 포커스 헤제
            await Future.delayed(Duration(milliseconds: 200));  // Pixel Overflow 발생 -> 딜레이 후 페이지 이동
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SearchCodeTextField(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}