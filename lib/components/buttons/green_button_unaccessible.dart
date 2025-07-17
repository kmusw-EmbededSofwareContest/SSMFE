import 'package:flutter/material.dart';

class GreenButtonUnaccessible extends StatelessWidget {
  const GreenButtonUnaccessible({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AbsorbPointer(  // 터치 x
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD3D3D3),
          minimumSize: Size(width * 0.77, 50),
        ),
        child: Text(
          '수동코드를 입력해주세요',
          style: TextStyle(
            fontSize: width * 0.07,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
