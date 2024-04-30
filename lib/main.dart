import 'package:blog/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              titleMedium: TextStyle(
                color: secondryTextColor,
                fontFamily: defaultFontFamily,
                fontSize: 15,
              ),
              titleLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor),
              bodyMedium: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondryTextColor,
                fontSize: 14,
              ))
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: const HomeScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 15, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, User\'s Name!',
                      style: themeData.textTheme.titleMedium,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Text(
                  'Explore Today\'s',
                  style: themeData.textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(32, 8, 32, 0),
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          colors: [
                                            Color(0xff376AED),
                                            Color(0xff49B0E2),
                                            Color(0xff9CECFB),
                                          ])),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: EdgeInsets.all(3),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/img/stories/${story.imageFileName}')),
                                  ),
                                  // child: Image.asset('assets/img/stories/story_01.jpg'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                      'assets/img/icons/${story.iconFileName}',
                                      width: 30,
                                      height: 30,),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(story.name),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
