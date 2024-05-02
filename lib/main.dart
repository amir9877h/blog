import 'package:blog/data.dart';
import 'package:blog/gen/assets.gen.dart';
import 'package:blog/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondryTextColor = Color(0xff2D4379);
    final primaryColor = Color(0xff376AED);
// Assets.img.

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: primaryColor,
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.

          colorScheme: ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            onBackground: primaryTextColor,
            surface: Colors.white,
            background: Color(0xffFBFCFF),
          ),
          // primarySwatch: Colors.blue,

          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.lightBlue,
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: defaultFontFamily))
              // style: ButtonStyle(
              //   textStyle: MaterialStateProperty.all(TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //     fontFamily: defaultFontFamily,
              //     // color: Colors.green
              //   ))
              // )
              ),
          textTheme: TextTheme(
              headlineSmall: TextStyle(
                fontFamily: defaultFontFamily,
                color: primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              headlineMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 24,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700),
              titleSmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: primaryTextColor),
              titleMedium: TextStyle(
                color: secondryTextColor,
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w200,
                fontSize: 18,
              ),
              titleLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: primaryTextColor),
              bodySmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2),
                  fontSize: 10),
              bodyMedium: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondryTextColor,
                fontSize: 14,
              ))
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      // home: Stack(children: [
      //   Positioned.fill(child: const HomeScreen()),
      //   Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      // ]),
      home: SplashScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20, color: Color(0x9B8487).withOpacity(0.3))
              ]),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  _BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Articles'),
                  SizedBox(
                    width: 8,
                  ),
                  _BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                  _BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Color(0xff376AED),
                      borderRadius: BorderRadius.circular(32.5),
                      border: Border.all(color: Colors.white, width: 4)),
                  child: Image.asset('assets/img/icons/plus.png')),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;

  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
