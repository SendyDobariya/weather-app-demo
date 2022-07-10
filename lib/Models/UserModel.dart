// class UserModel {
//   String name;
//   int age;
//   String emailId;

//   UserModel({required this.name,required this.age,required this.emailId});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     age = json['age'];
//     emailId = json['email_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['age'] = this.age;
//     data['email_id'] = this.emailId;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.name,
    required this.age,
    required this.emailId,
  });

  String name;
  int age;
  String emailId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        emailId: json["email_id"] == null ? null : json["email_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "email_id": emailId == null ? null : emailId,
      };
}
