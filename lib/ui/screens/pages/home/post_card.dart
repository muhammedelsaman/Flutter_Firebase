import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      margin:
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/PI.png'),
                    radius: 30.0,
                    backgroundColor: Color(0xff9CB3BE),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Color(0xff9CB3BE),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark,
                      color: Color(0xff9CB3BE),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 10,
                        right: 10.0,
                        bottom: 10.0,
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            color: Color(0xff9CB3BE),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 2.0),
                            color: const Color(0xffF5F5F5),
                            child: const Text(
                              '5',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Image.asset(
                'assets/images/PI.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة , لقد تم توليد هذا النص من مولد النص',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff2A5579),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}
