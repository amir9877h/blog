import 'package:blog/gen/assets.gen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      fontSize: 18,
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16),
                child: Assets.img.icons.logo.svg(width: 120)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: (){
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              'login'.toUpperCase(),
                              style: tabTextStyle.apply(color: selectedTabIndex == loginTab? Colors.white:Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              'Sign up'.toUpperCase(),
                              style: tabTextStyle.apply(color: selectedTabIndex == signUpTab? Colors.white:Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: selectedTabIndex==loginTab? _Login(themeData: themeData):_SignUp(themeData: themeData),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineMedium,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Sing in with your account',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        PasswordTextField(),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {},
          child: Text('Login'.toUpperCase()),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Forget your password?'),
            TextButton(onPressed: () {}, child: Text('Reset password')),
          ],
        ),
        Center(
          child: Text(
            'Or Sign In With'.toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Assets.img.icons.google.image(width: 48),
            Assets.img.icons.facebook.image(width: 48),
            Assets.img.icons.twitter.image(width: 48),
            SizedBox(),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to our blog',
          style: themeData.textTheme.headlineMedium,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your information',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Full Name')),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        PasswordTextField(),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {},
          child: Text('Sign up'.toUpperCase()),
        ),
        SizedBox(
          height: 12,
        ),

        Center(
          child: Text(
            'Or Sign up With'.toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Assets.img.icons.google.image(width: 48),
            Assets.img.icons.facebook.image(width: 48),
            Assets.img.icons.twitter.image(width: 48),
            SizedBox(),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: Text('Password'),
          suffix: InkWell(
            // style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(
              obscureText ? 'Show' : 'Hide',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.primary),
            ),
          )),
    );
  }
}
