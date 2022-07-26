import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_two/Features/introduction/preview/introduction_page_page.dart';
import 'package:m_two/main_mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MainMobx mainMobx = MainMobx();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    mainMobx.darkMode = SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      mainMobx.updateBrightness(SchedulerBinding.instance.window.platformBrightness == Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
    };
    return Observer(
      builder: (_) => MaterialApp(
        title: 'My TODO list',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: mainMobx.darkMode ? ThemeData.dark() : ThemeData.light(),
        home: IntroductionPage(),
      ),
    );
  }
}
