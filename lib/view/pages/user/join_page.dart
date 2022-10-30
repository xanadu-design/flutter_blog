import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
                "회원가입 페이지",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ), //위험한 상황이 생길 수 있어 스크롤이 되어야 하므로 박스 삽입
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    //참고: Widget은 최상위 부모 타입
    return Form(
      //한번에 유효성 검사하려면 Form 안에 넣는 것이 좋다
      key: _formKey, //formKey가 있으면 외부 어디에서든 이 Form에 접근할 수 있다.
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(LoginPage());
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text("로그인 페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
