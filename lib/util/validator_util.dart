import 'package:validators/validators.dart';

Function validateUsername() {
  //GetUtils.isEmail() get써도 된다는..
  return (String? value) {
    //안전을 위해 String 써줌
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (contains(value, " ")) {
      return "공백이 포함될 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "한글이나 특수문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "유저이름은 12글자를 초과할 수 없습니다.";
    } else if (value.length < 3) {
      return "유저이름은 3글자 이상이어야 합니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    //안전을 위해 String 써줌
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (contains(value, " ")) {
      return "공백이 포함될 수 없습니다.";
    } else if (value.length > 12) {
      return "비밀번호는 12글자를 초과할 수 없습니다.";
    } else if (value.length < 4) {
      return "비밀번호는 4글자 이상이어야 합니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    //안전을 위해 String 써줌
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (contains(value, " ")) {
      return "공백이 포함될 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    //안전을 위해 String 써줌
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목은 30자를 초과할 수 없습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    //안전을 위해 String 써줌
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용은 최대 500자까지 작성 가능합니다.";
    } else {
      return null;
    }
  };
}
