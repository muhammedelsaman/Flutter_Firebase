import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Center(
          child: Text(
        'حسابي',
        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}
