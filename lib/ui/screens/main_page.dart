import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
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
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff15567C),
          onPressed: () {
            showDialog(
                context: context,
                barrierColor: Colors.grey[400],
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xff9CB3BE),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt,
                                        color: Color(0xff398BAF),
                                        size: 70,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'رفع صورة',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xff2A5579),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Text('اكتب تعليقا حول الصورة',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffBECCD4),
                                    )),
                              ),
                              TextField(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff2A5579),
                                ),
                                maxLines: 2,
                                maxLength: 120,
                                controller: _textController,
                                cursorColor: const Color(0xff2A5579),
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffF26D33),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  MaterialButton(
                                    minWidth: 90,
                                    height: 50.0,
                                    color: const Color(0xffF26D33),
                                    shape: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Color(0xffF26D33)),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'نشر',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  MaterialButton(
                                    minWidth: 90,
                                    height: 50.0,
                                    color: const Color(0xffFFFFFF),
                                    shape: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Color(0xffF26D33)),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'تجاهل',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
