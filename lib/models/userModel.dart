class User {
  int? code;
  String? status;
  String? error;
  String? accessToken;
  Guardian? guardian;

  User({this.code, this.status, this.error, this.accessToken, this.guardian});

  User.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    error = json['error'];
    accessToken = json['accessToken'];
    guardian = json['guardian'] != null
        ? Guardian.fromJson(json['guardian'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['error'] = error;
    data['accessToken'] = accessToken;
    if (guardian != null) {
      data['guardian'] = guardian!.toJson();
    }
    return data;
  }
}

class Guardian {
  int? id;
  String? phoneNo;
  String? password;
  String? updatedAt;
  String? createdAt;

  Guardian(
      {this.id, this.phoneNo, this.password, this.updatedAt, this.createdAt});

  Guardian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNo = json['phoneNo'];
    password = json['password'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phoneNo'] = phoneNo;
    data['password'] = password;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
