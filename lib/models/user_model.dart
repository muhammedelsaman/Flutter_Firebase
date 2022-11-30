import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()

class UserModel {
  String? email;
  String? password;
  String? surepassword;
  String? firstname;
  String? lastname;
  String? uid;

  UserModel({
      this.email,
      this.password,
      this.surepassword,
      this.firstname,
      this.lastname,
      this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}
