import 'package:flutter/material.dart';
import 'package:insta_mi/IntroScreen.dart';
import 'package:insta_mi/Login/index.dart';

import 'HomeScreen.dart';
import 'Login/signUp.dart';
import 'Slapsh.dart';
import 'UploadImageScreen.dart';


class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Dribbble Animation App",
      debugShowCheckedModeBanner: false,
      home: new Splash(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/intro':
            return new MyCustomRoute(
              builder: (_) => new IntroScreen(),
              settings: settings,
            );
            
          case '/login':
          return new MyCustomRoute(
            builder: (_) => new LoginScreen(),
            settings: settings,
          );

               case '/signUp':
          return new MyCustomRoute(
            builder: (_) => new SignUpScreen(),
            settings: settings,
          );
          
        case '/home':
            return new MyCustomRoute(
              builder: (_) => new HomeScreen(),
                            settings: settings,
                          );


        case '/upload':
            return new MyCustomRoute(
              builder: (_) => new UploadImageScreen(),
                            settings: settings,
                          );


                      }
                    },
                  ));
                }
              }

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
