import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_demo/shared/styles/constant_text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/ConstansColors.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({Key? key}) : super(key: key);


  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Constant.textColorBlue),
        title: Text(
          'تعديل الحساب',
          style: ConstStyleText.title18GrayTextStyle,
        ),
        backgroundColor: Constant.colorBackground,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding:
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'البريد الالكتروني',
                  style: ConstStyleText.medium14BlackTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration:  const InputDecoration(
                    fillColor: Color(0xff9CB3BE),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (String? value) {
                    RegExp regex = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                    if (value!.isNotEmpty &&
                        !regex.hasMatch(value.trim())) {
                      return 'الرجاء ادخال بريد الكتروني صحيح';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h,),
                Text(
                  'الاسم الأول',
                  style: ConstStyleText.medium14BlackTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp("[a-z A-Zء-ي]")),
                  ],
                  decoration:   const InputDecoration(
                    fillColor: Color(0xff9CB3BE),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Constant.colorBackground,
                      ),
                    ),
                  ),
                  controller: _firstNameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال الاسم الأول';
                    } else if (value.length < 2 &&
                        value.length >= 45) {
                      return 'الرجاء ادخال الاسم الأول بشكل صحيح';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h,),
                Text(
                  'الاسم الأخير',
                  style: ConstStyleText.medium14BlackTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp("[a-z A-Zء-ي]")),
                  ],
                  decoration:   const InputDecoration(
                    fillColor: Color(0xff9CB3BE),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Constant.colorBackground,
                      ),
                    ),
                  ),
                  controller: _lastNameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال الاسم الأخير';
                    } else if (value.length < 2 &&
                        value.length >= 45) {
                      return 'الرجاء ادخال الاسم الأخير بشكل صحيح';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 70.h,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: Constant.textColorWhite,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: Constant.defaultColor,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                        // function: () {
                        //   if (_formKey.currentState!.validate()) {
                        //     LayoutCubit.get(context).editUser(
                        //       email: _emailController.text,
                        //       firstName: _firstNameController.text,
                        //       lastName: _lastNameController.text,
                        //     );
                        //   }
                        // },
                        child: const Text(
                          'تحديث البيانات'
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

