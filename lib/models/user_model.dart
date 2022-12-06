import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()

class UserModel {
  String? uId;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? profileImageUrl;
  String? coverImageUrl;
  List<String>? posts;


  UserModel({
      this.uId,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.profileImageUrl,
      this.coverImageUrl,
      this.posts = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}
