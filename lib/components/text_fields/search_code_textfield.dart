import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studysmartmate/controllers/code_insert_page_controller.dart';

class SearchCodeTextField extends StatelessWidget {
  const SearchCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CodeInsertPageController>();
    final textController = TextEditingController();
    return SizedBox(
      child: TextField(
        controller: textController,
        onSubmitted: (value) {
          controller.updateInsertedValue(value);
        },
        decoration: InputDecoration(
          hintText: '수동코드를 입력해주세요!',
          prefixIcon: const Icon(Icons.search),
          hintStyle: const TextStyle(fontSize: 18),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.blue),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}