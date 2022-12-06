import 'package:flutter_firebase_demo/services/service_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model.dart';

///////// Interface ///////
abstract class IPostService {
  static final provider = Provider<IPostService>(
        (ref) => PostService(),
  );


  Future<PostModel> createPost({
    required text,
    String? image,
  });

  Future<PostModel> getPost();

  Future<void> pickerImagePostGallery();

  Future<void> uploadImagePost({required String text});
}