// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "sign_in": "Sign In",
  "username": "User Name",
  "password": "Password",
  "forget_password": "Forget Password",
  "login": "Login",
  "or": "Or",
  "dont_have_account": "Don't Have Account",
  "create_account": "Create Account",
  "register_new_account": "Register New Account",
  "email": "Email",
  "confirm_password": "Confirm Password",
  "first_name": "First Name",
  "last_name": "Last Name",
  "main": "Main",
  "profile": "Profile",
  "favorite": "Favorite",
  "archives": "Archives",
  "Text": "This text is an example of text that can be replaced in the same space. This text has been generated from the text generator",
  "publish": "Publish",
  "discard": "Discard",
  "update_profile": "Update Profile",
  "settings": "Settings",
  "logout": "Log Out",
  "language": "Language"
};
static const Map<String,dynamic> ar = {
  "sign_in": "تسجيل الدخول",
  "username": "اسم المستخدم",
  "password": "كلمة المرور",
  "forget_password": "نسيت كلمة المرور",
  "login": "تسجيل الدخول",
  "or": "أو",
  "dont_have_account": "اذا لم يكن لديك حساب",
  "create_account": "انشاء حساب",
  "register_new_account": "تسجيل حساب جديد",
  "email": "",
  "confirm_password": "تاكيد كلمة المرور",
  "first_name": "الاسم الاول",
  "last_name": "الاسم الاخير",
  "main": "الرئيسية",
  "profile": "حسابي",
  "favorite": "المفضلة",
  "archives": "المحفوظات",
  "Text": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص",
  "publish": "نشر",
  "discard": "تجاهل",
  "update_profile": "تعديل بياناتي",
  "settings": "الاعدادات",
  "logout": "تسجيل الخروج",
  "language": "اللغة"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
