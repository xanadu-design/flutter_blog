import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://192.168.35.141:8080";

//통신역할
class PostProvider extends GetConnect {
  // Promise : 데이터 약속; Future을 사용하는/ 사용해야하는 이유
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken ?? ""});
  Future<Response> findById(int id) =>
      get("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> deletedById(int id) =>
      delete("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});
  Future<Response> updateById(int id, Map data) =>
      put("$host/post/$id", data, headers: {"Authorization": jwtToken ?? ""});

  Future<Response> save(Map data) =>
      post("$host/post", data, headers: {"Authorization": jwtToken ?? ""});
}
