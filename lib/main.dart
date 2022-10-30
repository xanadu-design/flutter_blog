import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //라우트 설계 필요 없음, GetX 사용 예정
      home: LoginPage(),
    );
  }
}
