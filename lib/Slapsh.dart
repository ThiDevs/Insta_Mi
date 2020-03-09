
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 1)).then((_){
        Navigator.pushNamed(context, "/intro");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset("assets/img/logo.png"),
              ),
            )
        );
  }
}

