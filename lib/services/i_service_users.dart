import 'package:flutter_firebase_demo/services/service_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///////// Interface ///////
abstract class IUserService {
  static final provider = Provider<IUserService>(
        (ref) => UserService(),
  );

  Future<void> login ({
    required String email,
    required String password,
  });

  Future<void> register ({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  });

}