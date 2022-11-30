import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_demo/models/user_model.dart';
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
  final UserModel userModel;
  LoginSuccess(this.userModel);
}

class LoginError extends LoginStates {
  final String error;

  LoginError(this.error);
}

class CreateUserSuccess extends LoginStates {
  final UserModel userModel;
  CreateUserSuccess(this.userModel);
}

class CreateUserError extends LoginStates {
  final String error;

  CreateUserError(this.error);
}

class LoginNotLogged extends LoginStates {
  LoginNotLogged();
}

class AuthUserNotifier extends StateNotifier<LoginStates> {
  static final provider = StateNotifierProvider<AuthUserNotifier, LoginStates>(
    (ref) => AuthUserNotifier(
      ref.read(IUserService.provider),
    ),
  );

  AuthUserNotifier(this._iUserService) : super(LoginInitial());
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
    //try {
      final dataRegister = await _iUserService.register(
        email: email,
        password: password,
        surepassword: surepassword,
        firstname: firstname,
        lastname: lastname,
      );

      state = LoginSuccess(dataRegister);

      debugPrint(state.toString());
      debugPrint('ooooo');
    // } catch (e) {
    //   state = LoginError((e as StateError).message);
    // }
  }

  Future<void> createRegister({
    required String email,
    required String password,
    required String surepassword,
    required String firstname,
    required String lastname,
    required String uid,
  }) async {
    state = LoginLoading();
    //try {
    final dataRegister = await _iUserService.createUser(
        email: email,
        password: password,
        surepassword: surepassword,
        firstname: firstname, lastname: lastname,
        uid: uid,
    );

    state = CreateUserSuccess(dataRegister);

    debugPrint(state.toString());
    debugPrint('ooooo');
    // } catch (e) {
    //   state = LoginError((e as StateError).message);
    // }
  }
}
