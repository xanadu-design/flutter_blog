import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();
    print("로그인 유저 아이디: ${u.principal.value.id}");
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 아이디: $id, 로그인 상태: ${u.isLogin}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${p.post.value.title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              Divider(),
              u.principal.value.id == p.post.value.user!.id
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await p.deleteById(p.post.value.id!);
                            Get.off(() =>
                                HomePage()); // off는 이전화면 날린다는 뜻. 상태관리로 갱신시킬 수 있음. back 써도 되긴 함.
                          },
                          child: Text("삭제"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage());
                          },
                          child: Text("수정"),
                        ),
                      ],
                    )
                  : SizedBox(),
              Expanded(
                child: SingleChildScrollView(
                  //List가 아니라 하나밖에 안들어오니까 ListView말고 이거 사용
                  child: Text("${p.post.value.content}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
