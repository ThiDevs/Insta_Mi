import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
// import '../../Components/SignUpLink.dart';
// import '../../Components/Form.dart';
// import '../../Components/SignInButton.dart';
// import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
// import 'package:video_player/video_player.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);
  @override
  SignUpScreenState createState() => new SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;

  List<TextEditingController> controllers = [new TextEditingController(),new TextEditingController(),new TextEditingController(),new TextEditingController() ];


// VideoPlayerController _controller;

   @override
  void initState() {
    super.initState();

        _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
        
        }
        

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Você tem certeza que quer sair?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Não'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/home"),
                child: new Text('Sim'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Material(
          child: new Container(
            margin: EdgeInsets.only(top: 50),
              // decoration: new BoxDecoration(
              //   image: backgroundImage,
                
              //   gradient: new LinearGradient(
              //       colors: <Color>[
              //         const Color.fromRGBO(162, 146, 199, 0.8),
              //         const Color.fromRGBO(0,0,0,0),
              //       ],
              //       stops: [0.2, 1.0],
              //       begin: const FractionalOffset(0.0, 0.0),
              //       end: const FractionalOffset(0.0, 1.0),
              //     )                ,
              // ),
              child: 
              Stack( children: <Widget>[
              
              new Container(
                decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroud.jpg"),
            fit: BoxFit.cover,
          ),
        ),
  
      // child: SizedBox.expand(
      //         child: FittedBox(
      //           fit: BoxFit.cover,
      //           child: SizedBox(
      //             width: _controller.value.size?.width ?? 0,
      //             height: _controller.value.size?.height ?? 0,
      //             child: VideoPlayer(_controller),
      //           ),
      //         ),)
 
      ),

// new Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               gradient: LinearGradient(
//                   begin: FractionalOffset.topCenter,
//                   end: FractionalOffset.bottomCenter,
//                   colors: [

//                     // Colors.grey.withOpacity(0.0),
//                     // Colors.deepPurple,
//                     Colors.orange.withOpacity(1),

//                     Colors.orange.withOpacity(0),

//                     // Color.fromRGBO(101, 0, 172, 0),

//                   ])),
//         ),


              new Container(
        child: new ListView(
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Tick(image: tick,),
                              new FormContainer(controllers),
                              new SignUp()
                            ],
                          ),
                          animationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: new InkWell(
                                      onTap: () async {
                                   
                                        // _playAnimation();

                                      var name = controllers[0].text;
                                      var email = controllers[1].text;
                                      var username = controllers[2].text;
                                      var pass = controllers[3].text;



                                      String url = "http://192.168.1.4:3000/Home/SignUp?name=$name&email=$email&username=$username&pass=$pass";
                                      print(url);
                                     
                                      Response response = await get(url); 

                                      Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(response.body),
                                          ));



                                      },
                                      child:
                                       new SignIn()
                                      ),
                                )
                              : new StaggerAnimation(
                                  buttonController:
                                      _loginButtonController.view),
                        ],
                      ),
                    ],
                  )),
                  
                       
                  
                  ]),
        ))));
  }
}


class Tick extends StatelessWidget {
  final DecorationImage image;
  Tick({this.image});
  @override
  Widget build(BuildContext context) {
    return (new Container(
                width: 50,
                height: 50,
                child: Image.asset("assets/img/logo.png"),
              
    ));
  }
}

class SignIn extends StatelessWidget {
  SignIn();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 180.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: new Text(
        "Cadastrar",
        style: new TextStyle(
          color: Colors.deepOrange,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}

class FormContainer extends StatelessWidget {
  List<TextEditingController> controllers;
  
  FormContainer(this.controllers);
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new InputFieldArea(
                controller: controllers[0],
                hint: "Nome Completo",
                obscure: false,
                icon: Icons.person_outline,
              ),
              new InputFieldArea(
                controller: controllers[1],
                hint: "Email",
                obscure: false,
                icon: Icons.person_outline,
              ),
              new InputFieldArea(
                controller: controllers[2],
                hint: "Username",
                obscure: false,
                icon: Icons.person_outline,
              ),
              new InputFieldArea(
                controller: controllers[3],
                hint: "Senha",
                obscure: true,
                icon: Icons.lock_outline,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}


class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  TextEditingController controller;
  InputFieldArea({this.hint, this.obscure, this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: EdgeInsets.only(top: 20),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.4,
            color: Colors.deepOrange,
          ),
        ),
      ),
      child: new TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.deepOrange,
          fontStyle: FontStyle.italic
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: Colors.orange,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.orange, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 25.0, left: 5.0),
        ),
      ),
    ));
  }
}


class SignUp extends StatelessWidget {
  SignUp();
  @override
  Widget build(BuildContext context) {
    return (new FlatButton(
      padding: const EdgeInsets.only(
        top: 160.0,
      ),
      onPressed: (){

        Navigator.pushNamed(context, "/signUp");

      },
      child: new Text(
        "",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.black,
            fontSize: 12.0),
      ),
    ));
  }
}
