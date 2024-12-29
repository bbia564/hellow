import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hellow_world/pages/hello_path/hello_path_binding.dart';
import 'package:hellow_world/pages/hello_path/hello_path_view.dart';
import 'package:hellow_world/pages/hellow_about/hellow_about_binding.dart';
import 'package:hellow_world/pages/hellow_about/hellow_about_view.dart';
import 'package:hellow_world/pages/hellow_about/hellow_dance.dart';
import 'package:hellow_world/pages/hellow_main/hellow_main_binding.dart';
import 'package:hellow_world/pages/hellow_main/hellow_main_view.dart';
import 'package:hellow_world/pages/hellow_setting/hellow_setting_binding.dart';
import 'package:hellow_world/pages/hellow_setting/hellow_setting_view.dart';

Color primaryColor = const Color(0xff404040);
Color bgColor = const Color(0xfff4f4f4);
List<Color> bgColors = const [
  Color(0xffff0000),
  Color(0xff74f7d6),
  Color(0xff0062ff),
  Color(0xffffb100),
  Color(0xffffeb00),
  Color(0xff00ff0a),
  Color(0xffbc9e59),
  Color(0xffff07e2),
  Color(0xff07cfff),
  Color(0xff404040),
];

List<Color> titleColors = const [
  Color(0xffff0000),
  Color(0xff404040),
  Colors.white
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Lights,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Lights = [
  GetPage(name: '/', page: () => const HelloPathView(), binding: HelloPathBinding()),
  GetPage(name: '/helloMain', page: () => HellowMainPage(), binding: HellowMainBinding()),
  GetPage(name: '/doing', page: () => const HellowDance()),
  GetPage(name: '/helloAbout', page: () => HellowAboutPage(), binding: HellowAboutBinding()),
  GetPage(name: '/helloSetting', page: () => HellowSettingPage(), binding: HellowSettingBinding()),
];
