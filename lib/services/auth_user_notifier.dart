import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_demo/services/i_service_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LoginStates {
  LoginStates();
}

class LoginInitial extends LoginStates {
  LoginInitial();
}

class LoginLoading extends LoginStates {
  LoginLoading();
}

class LoginSuccess extends LoginStates {
  LoginSuccess(void dataLogin);
}

class LoginError extends LoginStates {
  final String error;

  LoginError(this.error);
}

class LoginNotLogged extends LoginStates {
  LoginNotLogged();
}

class AuthNotifier extends StateNotifier<LoginStates> {
  static final provider = StateNotifierProvider<AuthNotifier, LoginStates>(
    (ref) => AuthNotifier(
      ref.read(IUserService.provider),
    ),
  );

  AuthNotifier(this._iUserService) : super(LoginInitial());
  final IUserService _iUserService;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = LoginLoading();
    try {
      final dataLogin =
          await _iUserService.login(email: email, password: password);
      state = LoginSuccess(dataLogin);
      debugPrint(state.toString());
      debugPrint('ooooo');
    } catch (e) {
      state = LoginError((e as StateError).message);
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String surepassword,
    required String firstname,
    required String lastname,
  }) async {
    state = LoginLoading();
    try {
      final dataRegister = await _iUserService.register(
        email: email,
        password: password,
        firstname: firstname,
        lastname: lastname,
      );
      state = LoginSuccess(dataRegister);

      debugPrint(state.toString());
      debugPrint('ooooo');
    } catch (e) {
      state = LoginError((e as StateError).message);
    }
  }
}
