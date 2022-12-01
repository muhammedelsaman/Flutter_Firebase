import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/ui/screens/layout_screen.dart';
import 'package:flutter_firebase_demo/ui/screens/login_screen.dart';
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
        title: const Text(
          'أنشاء حساب',
          style: TextStyle(
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
                  const Text(
                    'البريد الالكتروني',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          return 'يجب ادخال البريد الالكتروني';
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
                  const Text(
                    'كلمة المرور',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          return 'يجب اخال كلمة المرور';
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
                  const Text(
                    'تأكيد كلمة المرور',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          return 'تاكد من كلمة المرور';
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
                  const Text(
                    'الاسم الاول',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          return 'يجب اخال الاسم الاول';
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
                  const Text(
                    'الاسم الاخير',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          return 'يجب ادخال الاسم الاخير';
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
                                builder: (context) => const LayoutScreen(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'انشاء حساب',
                          style: TextStyle(
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
