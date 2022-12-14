import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/generated/locale_keys.g.dart';
import 'package:flutter_firebase_demo/ui/screens/login_screen.dart';
import 'package:flutter_firebase_demo/ui/screens/pages/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/auth_user_notifier.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _surepassword = '';
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title:  Text(
          LocaleKeys.create_account.tr(),
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff2A5579),
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Color(0xff2A5579),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).padding.horizontal + 16,
              vertical: 5.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                   Text(
                   LocaleKeys.email.tr(),
                    style:
                        const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onSaved: (value) {
                        _email = value ?? '';
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '?????? ?????????? ???????????? ????????????????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    LocaleKeys.password.tr(),
                    style:
                        const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onSaved: (value) {
                        _password = value ?? '';
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '?????? ???????? ???????? ????????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    LocaleKeys.confirm_password.tr(),
                    style:
                        const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onSaved: (value) {
                        _surepassword = value ?? '';
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '???????? ???? ???????? ????????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    LocaleKeys.first_name.tr(),
                    style:
                        const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onSaved: (value) {
                        _firstName = value ?? '';
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '?????? ???????? ?????????? ??????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                   Text(
                    LocaleKeys.last_name.tr(),
                    style:
                        const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onSaved: (value) {
                        _lastName = value ?? '';
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '?????? ?????????? ?????????? ????????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Consumer(
                    builder: (_, ref, __) {
                      return MaterialButton(
                        minWidth: double.infinity,
                        height: 50.0,
                        color: const Color(0xffF26D33),
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Color(0xffF26D33)),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            ref
                                .read(AuthUserNotifier.provider.notifier)
                                .register(
                                  email: _email,
                                  password: _password,
                                  surepassword: _surepassword,
                                  firstname: _firstName,
                                  lastname: _lastName,
                                );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          LocaleKeys.create_account.tr(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
