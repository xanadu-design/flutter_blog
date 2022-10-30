import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

//목적: view와 통신, 즉 view는 controller에게만 요청하면 됨
// Controller는 토큰만 받음!
class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변수 변경시 UI가 자동 업데이트
  final principal = User().obs;

  void logout() {
    this.isLogin.value = false;
    jwtToken = null;
    // Get.Storage() 이거 있으면 로그인 유지 가능
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);
    if (principal.id != null) {
      //isLogin과 principal 모두 final이므로 바로 말고 .value로 값에 접근한다고 이해
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }
}
