import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/generated/locale_keys.g.dart';
import 'package:flutter_firebase_demo/ui/screens/pages/main_page.dart';
import 'package:flutter_firebase_demo/ui/screens/pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class MyTabs {
  final String? title;
  MyTabs({this.title});
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    MyTabs(title: LocaleKeys.main.tr()),
    MyTabs(title: LocaleKeys.profile.tr()),
  ];

  late MyTabs _myHandler;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _myHandler = _tabs[0];
    _tabController.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_tabController.index];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff15567C),
          elevation: 0.0,
          title: Text(
            _myHandler.title.toString(),
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF),
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            labelStyle:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            controller: _tabController,
            tabs: <Tab>[
              Tab(
                text: _tabs[0].title,
              ),
              Tab(
                text: _tabs[1].title,
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children:  const [MainPage(), ProfilePage()],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xffFFFFFF),
          child: ListView(
            children: <Widget>[
              Container(
                color: const Color(0xff398BAF),
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Color(0xffF5F5F5),
                        child: Icon(
                          Icons.person,
                          color: Color(0xff9CB3BE),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'محمد السمان',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    title: Text(
                      LocaleKeys.main.tr(),
                      style: const TextStyle(
                          color: Color(0xff398BAF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.home,
                      color: Color(0xff398BAF),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Color(0xff398BAF),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      LocaleKeys.profile.tr(),
                      style: const TextStyle(
                          color: Color(0xff398BAF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.home,
                      color: Color(0xff398BAF),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Color(0xff398BAF),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      LocaleKeys.archives.tr(),
                      style: const TextStyle(
                          color: Color(0xff398BAF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.bookmark,
                      color: Color(0xff398BAF),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Color(0xff398BAF),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      LocaleKeys.logout.tr(),
                      style: const TextStyle(
                          color: Color(0xff398BAF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.exit_to_app_sharp,
                      color: Color(0xff398BAF),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Color(0xff398BAF),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      LocaleKeys.language.tr(),
                      style: const TextStyle(
                          color: Color(0xff398BAF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.language,
                      color: Color(0xff398BAF),
                    ),
                    onTap: () {
                        if(context.locale.languageCode=='ar'){
                           context.setLocale(
                            const Locale(
                              "en",
                            ),
                          );
                        }else{
                          context.setLocale(
                            const Locale(
                              "ar",
                            ),
                          );
                        }

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
