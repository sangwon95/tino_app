import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:tino_app/utils/frame.dart';

import '../utils/color.dart';

/// 소셜 로그인 버튼
class SocialLoginButton extends StatelessWidget {

  final String name;
  final Color backgroundColor;
  final Color textColor;
  final BuildContext context;

  SocialLoginButton({required this.name, required this.backgroundColor, required this.textColor, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        width: double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(
                elevation: 1.0,
                backgroundColor: backgroundColor,
                padding: EdgeInsets.all(17.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
            onPressed: ()
            {
              if(name == '카카오로 로그인'){
                _doKakaoLogin();
              }
            },
            child: Frame.myText(
              text: name,
              fontSize: 1.1,
              color: textColor,
              fontWeight: FontWeight.w600,
            )
        )
    );
  }

  _doKakaoLogin() async {

    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공 ${token.accessToken}');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공 ${token.accessToken}');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

}