import 'package:get/get.dart';

const host = "http://192.168.35.141:8080";

//통신역할
class UserProvider extends GetConnect {
  //Promise : 데이터 약속; Future을 사용하는/ 사용해야하는 이유
  //post(url, body)가 실행됨

  Future<Response> login(Map data) => post("$host/login", data);
}
