
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_demo/services/i_service_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class UserService implements IUserService {
  static final provider = Provider<UserService>(
        (ref) => UserService(),
  );

  late UserModel userModel;

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {

      UserModel model = (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password)) as UserModel;

      final json = model as Map<String, dynamic>;
      return UserModel.fromJson(json);
    } catch (e) {
      throw StateError('failed');
    }
  }

  @override
  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        User user = value.user!;
        UserModel userModel = UserModel(
          uId: user.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );
        FirebaseFirestore.instance.collection('users').doc(user.uid).set(
            userModel.toJson());
      });

      final FirebaseAuth auth = FirebaseAuth.instance;

      final User? user = auth.currentUser;
      final uId = user?.uid;

      debugPrint(uId.toString());

      return userModel;
    } catch (e) {
      throw StateError('failed');
    }
  }

}
