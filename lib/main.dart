import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:tino_app/page/login_page.dart';
import 'package:tino_app/utils/color.dart';

void main() {

  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'a572d2d93516fba942a56bdabc3eda16',
    javaScriptAppKey: 'a3ae5ccaee5d89860815e69151622435',
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData();

    /// 상단 상태바 Color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white)
    );

    /// 앱 화면 세로 위쪽 방향으로 고정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


    return MaterialApp(
      title: '티노',
      debugShowCheckedModeBanner: false,
      theme:Theme.of(context).copyWith(
          colorScheme: themeData.colorScheme.copyWith(primary: mainColor),
          primaryTextTheme: themeData.textTheme.apply(fontFamily: 'nanum_square')
      ),

      localizationsDelegates:
      [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales:
      [
        Locale('ko', ''),
        Locale('en', ''),
      ],
      initialRoute: 'login_page',

      routes:
      {
        'login_page'      : (context) => LoginPage(),
      },
    );
  }
}
