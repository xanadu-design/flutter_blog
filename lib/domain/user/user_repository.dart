import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json을 Dart 오브젝트로 바꾸는 가공
class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);

    Response response = await _userProvider.login(loginReqDto.toJson());

    dynamic headers = response.headers;

    dynamic body = response.body;
    print(response);
    CMRespDto cmRespDto =
        CMRespDto.fromJson(body); //fromJson은 map을 받아서 class 만들어주는 함수
    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);
      String token = headers["authorization"];

      jwtToken = token;
      print("jwtToken: $jwtToken");

      return principal;
    } else {
      return User();
    }
  }
}
