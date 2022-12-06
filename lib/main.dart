import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/generated/codegen_loader.g.dart';
import 'package:flutter_firebase_demo/shared/styles/constant_text_style.dart';
import 'package:flutter_firebase_demo/ui/screens/pages/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
       assetLoader: const CodegenLoader(),
      path: "assets/translations",
      saveLocale: true,
      child:   const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    //context.locale;
    return  ScreenUtilInit(
      builder: (_,  child) =>
       MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            fontFamily: "Almarai",
            appBarTheme:  AppBarTheme(
                titleTextStyle:  ConstStyleText.title18GrayTextStyle),
            primarySwatch: Colors.blue,
            canvasColor: Colors.white),
        home:  Builder(
            builder: (context) {
            //print(context.locale);
            return const HomeScreen();
          }
        ),
      ),
    );
  }


}