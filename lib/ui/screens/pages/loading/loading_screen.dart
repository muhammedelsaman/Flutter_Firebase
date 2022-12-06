import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/shared/styles/constant_text_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/styles/ConstansColors.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.bouncingBall(color: Constant.textColorBlue, size: 60),
              LoadingAnimationWidget.bouncingBall(color: Constant.defaultColor, size: 60),
              LoadingAnimationWidget.bouncingBall(color: Constant.shadowColor, size: 60),
              LoadingAnimationWidget.bouncingBall(color: Constant.layoutAppbar, size: 60),
            ],
          ),
const SizedBox(
            height: 40,
          ),
          Text('جاري التحميل',
            style: ConstStyleText.medium14BlueTextStyle
          ),
        ],
      ),
    );
  }
}

