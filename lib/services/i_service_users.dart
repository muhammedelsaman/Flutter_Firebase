import 'package:flutter_firebase_demo/models/user_model.dart';
import 'package:flutter_firebase_demo/services/service_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///////// Interface ///////
abstract class IUserService {
  static final provider = Provider<IUserService>(
        (ref) => UserService(),
  );

  Future<UserModel> login ({
    required String email,
    required String password,
  });

  Future<UserModel> register ({
    required String email,
    required String password,
    required String surepassword,
    required String firstname,
    required String lastname,
  });

  Future<UserModel> createUser({
    required email,
    required password,
    required surepassword,
    required firstname,
    required lastname,
    required uid,
  });

}