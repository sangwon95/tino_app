import 'package:flutter/material.dart';
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


}