import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_demo/services/i_service_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService implements IUserService {
  static final provider = Provider<UserService >(
        (ref) => UserService(),
  );
  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {

      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      // final loginResponse = await DioHelper.postData(
      //   url: EndPoint.login,
      //   data: {
      //     "email": email,
      //     "password": password,
      //   },
      // );
      // final json = loginResponse.data as Map<String, dynamic>;
      // return ShopLoginModel.fromJson(json);
    } catch (e) {
      throw StateError('failed');
    }
  }
  @override
  Future<void> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password,);

      // final registerResponse = await DioHelper.postData(
      //   url: EndPoint.register,
      //   data: {
      //     "email": email,
      //     "password": password,
      //   },
      // );
      // final json = registerResponse.data as Map<String, dynamic>;
      // return ShopLoginModel.fromJson(json);
    } catch (e) {
      throw StateError('failed');
    }
  }
}
