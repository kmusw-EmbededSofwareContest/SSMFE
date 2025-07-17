import 'package:flutter/material.dart';

import '../../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = LoginPageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            children: [
              Spacer(flex: 2,),
              Text(
                  'StudySmartMate\n에 오신걸 환영합니다!',
                style: TextStyle(
                  fontSize: width * 0.08,
                ),
              ),
              Spacer(flex: 1,),
              Image.asset(
                  'assets/icons/ssm_logo.png',
                width: width * 0.6,
              ),
              Spacer(flex: 1,),
              GestureDetector(
                child: Image.asset(
                    'assets/buttons/kakao_login_button.png',
                  width: width * 0.75,
                ),
                onTap: () {
                  controller.kakaoLogin();  //
                },
              ),
              Spacer(flex: 2,),
            ],
          )
      ),
    );
  }
}
