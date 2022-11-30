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
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      // UserModel model = UserModel(
      //     email: email,
      //     password: email,
      //     surepassword: '',
      //     firstname: '',
      //     lastname: '',
      //   uid: '',
      // );
      UserModel model = (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password)) as UserModel;

      final json = model as Map<String, dynamic>;
      return UserModel.fromJson(json);
    } catch (e) {
      throw StateError('failed');
    }
  }

  @override
  Future<UserModel> register({
    required email,
    required password,
    required surepassword,
    required firstname,
    required lastname,
  }) async {
    //try {
    UserModel model = UserModel(
      email: email,
      password: password,
      surepassword: surepassword,
      firstname: firstname,
      lastname: lastname,
    );

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final FirebaseAuth auth = FirebaseAuth.instance;

      final User? user = auth.currentUser;
      final uid = user?.uid;


    createUser(
      email: email,
      password: password,
      surepassword: surepassword,
      firstname: firstname,
      lastname: lastname,
      uid: uid,
    );

    debugPrint(uid.toString());

    // final json = UserModel as Map<String, dynamic>;
    // return UserModel.fromJson(json);

    return model;

    // } catch (e) {
    //   throw StateError('failed');
    // }
  }

  @override
  Future<UserModel> createUser({
    required email,
    required password,
    required surepassword,
    required firstname,
    required lastname,
    required uid,
  }) async {
    //try {
    UserModel model = UserModel(
      email: email,
      password: password,
      surepassword: surepassword,
      firstname: firstname,
      lastname: lastname,
      uid: uid,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toJson());

    return model;

    // } catch (e) {
    //   throw StateError('failed');
    // }
  }
}
