import 'package:flutter_firebase_demo/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';
@JsonSerializable()

class PostModel {
  String? uid;
  String? text;
  String? image;
  List<String>? likes;
  UserModel? user;


  PostModel({
    this.uid,
    this.text,
    this.image,
    this.likes,
    this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

}