import 'package:flutter/material.dart';
import 'package:tino_app/utils/frame.dart';

import '../utils/color.dart';
import '../widgets/button.dart';

/// 로그인 화면
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Icon(Icons.cloud_circle, color: mainColor, size: 150),

            SizedBox(height: 15),

            Center(
              child: Container(
                width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Frame.myText(
                          text: '하루 시작 커피 한잔,',
                          align: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          fontSize: 1.4,
                      ),

                      Frame.myText(
                          text: ' 티노',
                          align: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          fontSize: 1.4,
                          color: mainColor
                      ),
                    ],
                  )
              ),
            ),

            SizedBox(height: 60),

            SocialLoginButton(
                name: '카카오로 로그인',
                backgroundColor: Colors.yellow,
                textColor: Colors.black,
                context: context
            ),

            SocialLoginButton(
                name: 'Apple로 로그인',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                context: context
            ),

            SocialLoginButton(
                name: '구글로 로그인',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                context: context
            ),

            Container(
              height: 30,
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSolidLine(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
                    child: Frame.myText(text: 'or', color: Colors.grey),
                  ),
                  buildSolidLine(context),
                ],
              ),
            ),

            SocialLoginButton(
                name: '이메일로 로그인',
                backgroundColor: Colors.white70,
                textColor: Colors.black,
                context: context
            ),
        ]
      )
    ),
    );
  }

  buildSolidLine(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 1.0,
        color: Colors.grey,
      ),
    );
  }
}
