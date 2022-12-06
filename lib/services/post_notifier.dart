import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';
import 'i_service_model.dart';

abstract class PostStates {
  PostStates();
}

class CreatePostLoading extends PostStates {
  CreatePostLoading();
}

class CreatePostSuccess extends PostStates {
  final PostModel postModel;
  CreatePostSuccess(this.postModel);
}

class CreatePostError extends PostStates {
  final String error;

  CreatePostError(this.error);
}

class GetPostsLoading extends PostStates {
  GetPostsLoading();
}

class GetPostsSuccess extends PostStates {
  final PostModel postModel;
  GetPostsSuccess(this.postModel);
}

class GetPostsError extends PostStates {
  final String error;
  GetPostsError(this.error);
}

class PickerImagePostSuccess extends PostStates {

}
class PickerImagePostError extends PostStates {
  final String error;
  PickerImagePostError(this.error);
}

class UploadImagePostLoading extends PostStates {}
class UploadImagePostSuccess extends PostStates {
  final String imageUrl;
  UploadImagePostSuccess(this.imageUrl);
}
class UploadImagePostError extends PostStates {
  final String error;
  UploadImagePostError(this.error);
}



class PostNotifier extends StateNotifier<PostStates> {
  static final provider = StateNotifierProvider<PostNotifier, PostStates>(
    (ref) => PostNotifier(
      ref.read(IPostService.provider),
    ),
  );
  PostNotifier(this._iPostService) : super(CreatePostLoading());
  final IPostService _iPostService;
  UserModel userModel = UserModel();



// this function to choose photo from gallery
  File? postImage;
  var picker = ImagePicker();

  Future<void> pickerImagePostGallery(context)
  async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      postImage = File(image.path);
     state = PickerImagePostSuccess();
     //print(image.path);
    } else {
      state = PickerImagePostError(onError.toString());
    }
  }


  // function to upload photo post
  Future<void> uploadImagePost({
    required String text,
  }) async {

    state = UploadImagePostLoading();
        try {
          //await _iPostService.createPost(text: text);
          state = UploadImagePostSuccess(picker.toString());
        }
        catch (e) {
          state = UploadImagePostError((onError.toString()));
        }
  }

  // function to add post in firebase
  Future<void> createPost({
    required text,
  }) async {
    state = CreatePostLoading();
    try {
      final dataPost = await _iPostService.createPost(
            text: text,
          ),
          state = CreatePostSuccess(dataPost);

      debugPrint(state.toString());
      debugPrint('ooooo');
    } catch (e) {
      state = CreatePostError((e as StateError).message);
    }
  }




  // function get post in main screen
  Future<void> getPost() async {
    state = GetPostsLoading();
    try {
      final getDataPost = await _iPostService.getPost(),
          state = GetPostsSuccess(getDataPost);

      debugPrint(state.toString());
      debugPrint('ooooo');
    } catch (e) {
      state = GetPostsError((e as StateError).message);
    }
  }

}
