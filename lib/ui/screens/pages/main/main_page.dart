import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/services/post_notifier.dart';
import 'package:flutter_firebase_demo/ui/screens/pages/home/post_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {

  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return const PostCard();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff15567C),
          onPressed: () {
            showDialog(
                context: context,
                barrierColor: Colors.grey,
                builder: (BuildContext context) {
                  return Consumer(
                    builder: (_,ref,__) {
                      ref.watch(PostNotifier.provider);
                      File? postImage = ref.watch(PostNotifier.provider.notifier).postImage;
                      print(postImage);
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
                                    onTap: () {
                                      ref.read(PostNotifier
                                          .provider.notifier)
                                          .pickerImagePostGallery(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 250.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: const Color(0xff9CB3BE),
                                      ),
                                      child: ref.watch(PostNotifier.provider.notifier).postImage != null
                                      ? Image.file(postImage!,fit: BoxFit.fill,) :
                                      Column(
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
                                      Consumer(
                                        builder: (BuildContext context,
                                            WidgetRef ref, Widget? child) {
                                          return MaterialButton(
                                            minWidth: 90,
                                            height: 50.0,
                                            color: const Color(0xffF26D33),
                                            shape: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: Color(0xffF26D33)),
                                            ),
                                            onPressed: () {
                                              ref
                                                  .read(PostNotifier
                                                  .provider.notifier)
                                                  .uploadImagePost(
                                                text: _textController.text,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'نشر',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ),
                                          );
                                        },
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
                    },
                    // child: Dialog(
                    //   insetPadding: const EdgeInsets.all(10.0),
                    //   child: Stack(
                    //     alignment: Alignment.topCenter,
                    //     children: <Widget>[
                    //       Container(
                    //         width: double.infinity,
                    //         padding: const EdgeInsets.all(10.0),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10.0),
                    //         ),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             InkWell(
                    //               onTap: () {
                    //                 ref.read(PostNotifier
                    //                     .provider.notifier)
                    //                     .pickerImagePostGallery(context);
                    //               },
                    //               child: Container(
                    //                 width: double.infinity,
                    //                 height: 250.0,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10.0),
                    //                   color: const Color(0xff9CB3BE),
                    //                 ),
                    //                 child:
                    //                 Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: const [
                    //                     Icon(
                    //                       Icons.camera_alt,
                    //                       color: Color(0xff398BAF),
                    //                       size: 70,
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10.0,
                    //                     ),
                    //                     Text(
                    //                       'رفع صورة',
                    //                       style: TextStyle(
                    //                         fontSize: 16.0,
                    //                         color: Color(0xff2A5579),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             const SizedBox(
                    //               height: 20.0,
                    //             ),
                    //             Container(
                    //               alignment: Alignment.centerRight,
                    //               child: const Text('اكتب تعليقا حول الصورة',
                    //                   style: TextStyle(
                    //                     fontSize: 14.0,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Color(0xffBECCD4),
                    //                   )),
                    //             ),
                    //             TextField(
                    //               textDirection: TextDirection.rtl,
                    //               textAlign: TextAlign.right,
                    //               style: const TextStyle(
                    //                 fontSize: 16.0,
                    //                 color: Color(0xff2A5579),
                    //               ),
                    //               maxLines: 2,
                    //               maxLength: 120,
                    //               controller: _textController,
                    //               cursorColor: const Color(0xff2A5579),
                    //               decoration: const InputDecoration(
                    //                 focusedBorder: UnderlineInputBorder(
                    //                   borderSide: BorderSide(
                    //                     color: Color(0xffF26D33),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Consumer(
                    //                   builder: (BuildContext context,
                    //                       WidgetRef ref, Widget? child) {
                    //                     return MaterialButton(
                    //                       minWidth: 90,
                    //                       height: 50.0,
                    //                       color: const Color(0xffF26D33),
                    //                       shape: const OutlineInputBorder(
                    //                         borderRadius: BorderRadius.all(
                    //                           Radius.circular(10.0),
                    //                         ),
                    //                         borderSide: BorderSide(
                    //                             color: Color(0xffF26D33)),
                    //                       ),
                    //                       onPressed: () {
                    //                         ref
                    //                             .read(PostNotifier
                    //                                 .provider.notifier)
                    //                             .createPost(text: _textController.text);
                    //                         Navigator.pop(context);
                    //                       },
                    //                       child: const Text(
                    //                         'نشر',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //                           fontWeight: FontWeight.bold,
                    //                           color: Color(0xffFFFFFF),
                    //                         ),
                    //                       ),
                    //                     );
                    //                   },
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 20.0,
                    //                 ),
                    //                 MaterialButton(
                    //                   minWidth: 90,
                    //                   height: 50.0,
                    //                   color: const Color(0xffFFFFFF),
                    //                   shape: const OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                       Radius.circular(10.0),
                    //                     ),
                    //                     borderSide:
                    //                         BorderSide(color: Color(0xffF26D33)),
                    //                   ),
                    //                   onPressed: () {},
                    //                   child: const Text(
                    //                     'تجاهل',
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
