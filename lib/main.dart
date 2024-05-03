import 'package:blog/article.dart';
import 'package:blog/gen/assets.gen.dart';
import 'package:blog/home.dart';
import 'package:blog/profile.dart';
import 'package:blog/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    const primaryTextColor = Color(0xff0D253C);
    const secondryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
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
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
              titleSpacing: 32,
              // elevation: 0, //for removing shadow
              backgroundColor: Colors.white,
              foregroundColor: primaryTextColor),
          colorScheme: const ColorScheme.light(
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
                  textStyle: const TextStyle(
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
          textTheme: const TextTheme(
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
      home: const SplashScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;

const double bottomNavigationHeight = 65;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedBottomNavigationIndex = homeIndex;

  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _profileKey
  };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        final NavigatorState currentSelectedTabNavigatorState =
            map[selectedBottomNavigationIndex]!.currentState!;

        if (currentSelectedTabNavigatorState.canPop()) {
          currentSelectedTabNavigatorState.pop();
        } else if (_history.isNotEmpty) {
          setState(() {
            selectedBottomNavigationIndex = _history.last;
            _history.removeLast();
          });
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Stack(children: [
          Positioned.fill(
            bottom: bottomNavigationHeight,
            child: IndexedStack(
              index: selectedBottomNavigationIndex,
              children: [
                _navigator(_homeKey, homeIndex, const HomeScreen()),
                _navigator(_articleKey, articleIndex, const ArticleScreen()),
                _navigator(
                    _searchKey,
                    searchIndex,
                    const SearchScreen(
                      tabName: 'Search',
                    )),
                _navigator(_profileKey, menuIndex, const ProfileScreen()),
                // HomeScreen(),
                // ArticleScreen(),
                // SearchScreen(),
                // ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomNavigation(
              selectedIndex: selectedBottomNavigationIndex,
              onTap: (int index) {
                setState(() {
                  _history.remove(selectedBottomNavigationIndex);
                  _history.add(selectedBottomNavigationIndex);
                  selectedBottomNavigationIndex = index;
                });
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedBottomNavigationIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedBottomNavigationIndex != index,
                    child: child)),
          );
  }
}

// int screenNumber = 1;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.tabName, this.screenNumber = 1});
  final String tabName;
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Search Screen Coming Soon!\n#$screenNumber\ntab: $tabName'),
        ElevatedButton(
            onPressed: () {
              // screenNumber++;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreen(
                        tabName: tabName,
                        screenNumber: screenNumber + 1,
                      )));
            },
            child: const Text('Increase ME!'))
      ]),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const _BottomNavigation(
      {required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: bottomNavigationHeight,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20, color: const Color(0x009b8487).withOpacity(0.3))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                      onTap: () {
                        onTap(homeIndex);
                      },
                      svgIcon: Assets.img.icons.home,
                      isActive: selectedIndex == homeIndex,
                      // iconFileName: 'Home.svg',
                      // activeIconFileName: 'Home.svg',
                      title: 'Home'),
                  _BottomNavigationItem(
                      onTap: () {
                        onTap(articleIndex);
                      },
                      svgIcon: Assets.img.icons.article,
                      isActive: selectedIndex == articleIndex,
                      // iconFileName: 'Articles.png',
                      // activeIconFileName: 'Articles.png',
                      title: 'Articles'),
                  Expanded(child: Container()),
                  _BottomNavigationItem(
                      onTap: () {
                        onTap(searchIndex);
                      },
                      svgIcon: Assets.img.icons.search,
                      isActive: selectedIndex == searchIndex,
                      // iconFileName: 'Search.png',
                      // activeIconFileName: 'Search.png',
                      title: 'Search'),
                  _BottomNavigationItem(
                      onTap: () {
                        onTap(menuIndex);
                      },
                      svgIcon: Assets.img.icons.menu,
                      isActive: selectedIndex == menuIndex,
                      // iconFileName: 'Menu.png',
                      // activeIconFileName: 'Menu.png',
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
                      color: const Color(0xff376AED),
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
  // final String iconFileName;
  // final String activeIconFileName;
  final SvgGenImage svgIcon;
  final String title;
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem(
      {required this.title,
      required this.onTap,
      required this.isActive,
      required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgIcon.svg(
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(
                    isActive
                        ? themeData.colorScheme.primary
                        : const Color(0xff7B8BB2),
                    BlendMode.srcIn)),
            // Image.asset('assets/img/icons/$iconFileName'),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.bodySmall!.color),
            ),
          ],
        ),
      ),
    );
  }
}
