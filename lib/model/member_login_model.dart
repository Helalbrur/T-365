
class MemberLoginResponseModel {
  final String token;
  final String error;
  String name;
  String email;
  String id;
  String role='member';
  MemberLoginResponseModel({required this.token,required this.error,required this.name,required this.email,required this.id});

  factory MemberLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return MemberLoginResponseModel(
      token: json["token"] != null ? json["access_token"] : "",
      error: json["error"] != null ? json["error"] : "",
      name: json["name"] != null ? json["name"] : '',
      email: json["email"] != null ? json["email"] : '',
      id: json["id"] != null ? json["id"].toString() : '',
    
    );
  }
}


class MemberLoginRequestModel {
  String email;
  String password;
  String role;
  MemberLoginRequestModel({
    required this.email,
    required this.password,
    this.role='member'
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
      'role': 'member',
    };

    return map;
  }
}

class MemberRegisterResponseModel {
  final String token;
  final String error;
  String name;
  String email;
  String id;
  MemberRegisterResponseModel({required this.token,required this.error,required this.name,required this.email,required this.id});

  factory MemberRegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return MemberRegisterResponseModel(
      token: json["token"] != null ? json["access_token"] : "",
      error: json["error"] != null ? json["error"] : "",
      name: json["name"] != null ? json["name"] : '',
      email: json["email"] != null ? json["email"] : '',
      id: json["id"] != null ? json["id"].toString() : '',
    );
  }
}

class MemberRegisterRequestModel {
  String name;
  String email;
  String password;
  String mobile;
  String role;

  MemberRegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    this.role='member',
  });



  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'mobile': mobile.trim(),
      'role': 'member',
    };

    return map;
  }
}
