import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:introduction_screen/introduction_screen.dart';
  

class IntroScreen extends StatefulWidget{

 @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
       colorBegin: Colors.white,
        widgetDescription: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: 280), child:
           Text("Esteja pronto para cada momento!", style: new TextStyle(color: Colors.white, fontSize: 22),)
            )

          ],
        ),
        // pathImage: "assets/img/drawable-xxxhdpi/quiosque.png",
        backgroundImage: "assets/img/drawable-xxxhdpi/quiosque.png",
        // backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/photo_pencil.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/photo_ruler.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
   }

  void onDonePress() {
        Navigator.pushNamed(context, "/login");

  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      colorDot: Colors.white,
    );
  }
}

