import 'package:flutter/material.dart';
import '../../../../shared/components/navigator.dart';
import 'edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/PI.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  'assets/images/EL.png',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 45.0),
        const Text(
          'اسم المستخدم',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Color(0xff2A5579),
          ),
        ),
        const SizedBox(height: 20.0),
        const Text('User99@gmail.com'),
        const SizedBox(
          height: 150.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        const EditProfile());
                  },
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xffF26D33),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'تعديل بياناتي',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Color(0xff2A5579),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xffF26D33),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'الاعدادات',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Color(0xff2A5579),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xffF26D33),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'المفضلة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Color(0xff2A5579),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
