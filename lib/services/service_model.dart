import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';
import 'i_service_model.dart';

class PostService implements IPostService {
  static final provider = Provider<PostService>(
        (ref) => PostService(),
  );

   UserModel? user;

  @override
  Future<PostModel> createPost({
    required text,
    String? image,
  }) async {
    try {
      PostModel postModel = PostModel(
        uid: user?.uId,
        text: text,
        image: image,
        user: user,
        likes: [],
      );

      FirebaseFirestore.instance
          .collection('post')
          .doc(postModel.uid)
          .set(postModel.toJson(),);

      return postModel;
    } catch (e) {
      throw StateError('failed');
    }
  }



  List<PostModel> posts = [];

  @override
  Future<PostModel> getPost() async {
    try {

      FirebaseFirestore.instance.collection('posts').get(
          const GetOptions(
            source: Source.serverAndCache,
          )).then((value) {
        if (value.docs.isNotEmpty) {
          posts = value.docs.map((e) => PostModel.fromJson(e.data())).toList();
        } else {
        }
      });

      return PostModel();
    } catch (e) {
      throw StateError('failed');
    }
  }


  File? postImage;
  var picker = ImagePicker();

  @override
  Future<void> pickerImagePostGallery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      postImage = File(image.path);
    } else {
    }
  }



  @override
  Future<void> uploadImagePost({required String text}) async {
    if (postImage == null) {
      createPost(text: text);
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('post_image/${Uri.file(postImage!.path).pathSegments.last}').putFile(postImage!) as Reference;
      final UploadTask uploadTask = storageReference.putFile(postImage!);
      await uploadTask.then((value) {
        storageReference.getDownloadURL().then((value) {
          createPost(text: text, image: value);
        });
      }).catchError((error) {
        throw StateError('failed');
      });
    }
  }
}
