import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../post/home_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());
  //타입 추론이 자동으로 돼서 자료형 안적음
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지 ${u.isLogin}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ), //위험한 상황이 생길 수 있어 스크롤이 되어야 하므로 박스 삽입
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    //참고: Widget은 최상위 부모 타입
    return Form(
      key: _formKey,
      //한번에 유효성 검사하려면 Form 안에 넣는 것이 좋다
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                //Get.to(HomePage());
                //trim은 텍스트 양옆의 공백을 제거한다는 뜻
                int result =
                    await u.login(_username.text.trim(), _password.text.trim());
                print(result);
                if (result == 1) {
                  Get.to(() => HomePage());
                } else {
                  Get.snackbar("로그인 시도", "로그인 실패");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
