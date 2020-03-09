
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State  {

  @override
  Widget build(BuildContext context) {

    return  Material(
        type: MaterialType.transparency,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
listView(),

 Align(child: 

Container( height: 50, 
decoration: new BoxDecoration(
  boxShadow: [
      BoxShadow(
        color: Colors.black45 ,
        blurRadius: 20.0, // has the effect of softening the shadow
        spreadRadius: 5.0, // has the effect of extending the shadow
        offset: Offset(
          10.0, // horizontal, move right 10
          10.0, // vertical, move down 10
        ),
      )
    ],
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
              )
),

child: Row(children: <Widget>[
new Container(child: FaIcon(FontAwesomeIcons.home), margin: EdgeInsets.only(left: 50),),

],),
)
, alignment: Alignment.bottomCenter, ) 
           ,
Align(child: Container( height: 50, width: 50, margin: EdgeInsets.only(bottom: 25),
decoration: new BoxDecoration(
  boxShadow: [
      BoxShadow(
        color: Colors.black45 ,
        blurRadius: 95.0, // has the effect of softening the shadow
        spreadRadius: 10.0, // has the effect of extending the shadow
        offset: Offset(
          10.0, // horizontal, move right 10
          10.0, // vertical, move down 10
        ),
      )
    ],
              color: Colors.white,
              borderRadius: new BorderRadius.all(const Radius.circular(50.0),
              )
), child: GestureDetector(onTap: (){
        Navigator.pushNamed(context, "/upload");

}
, child: Center(child:FaIcon(FontAwesomeIcons.plus, size: 30, ) ,),)  ,

), alignment: Alignment.bottomCenter,),
           
            ],

          ),
        )
        );

  }
}

class PhotoFromPeople extends Container{
final String namePhoto;

PhotoFromPeople(this.namePhoto);


@override
  Widget build(BuildContext context) {

    return new Container(
      child:
      Column(children: <Widget>[


 new Container(
        margin: const EdgeInsets.only(left: 20),
        
              child: Row(children: <Widget>[

 Align (
                alignment: Alignment.topLeft,
                child: Container(

                  margin: const EdgeInsets.only(top: 20, right: 10),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all( Radius.circular(40.0),),
                    image: new DecorationImage(
                      image: new AssetImage('assets/img/drawable-xxxhdpi/homem.png'),
                        fit: BoxFit.cover,),
                        ),
                        height: 50,
                        width: 50,
                        ),),

       Align (
                alignment: Alignment.topLeft,
                child: Column(children: <Widget>[
                  Container( child: new Text("Diego Santos"),

                  ),

                   Container( child: new Text("Xiaomi Mi A2", style: TextStyle(color: Colors.black54),))

                ],) ),


              ],)),

              Container(
                width: 335,
                height: 400,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: new BoxDecoration(

                      image: new DecorationImage(image: new NetworkImage("http://192.168.1.4:3000/home/get?name=" + this.namePhoto),
                      fit: BoxFit.cover)
                    ),
              ),

              new Text("Olha que incrivel!! \n Essa foi tirada com o meu Xiaomi Mi A2", textAlign: TextAlign.center,)



    ],)

       ,

    ) ;


}

}


class ContainerPhoto extends Container{
  // ContainerPhoto(String s);

  final String namePhoto;
ContainerPhoto(this.namePhoto);

@override
  Widget build(BuildContext context) {

    return new Container(
      child: Column(children: <Widget>[

 Container(
                width: 230,
                height: 180,
decoration: new BoxDecoration(

      image: new DecorationImage(image: new NetworkImage("http://192.168.1.4:3000/home/get?name=" + this.namePhoto),
      fit: BoxFit.cover)
    ),


              ),

      ],) ,
    );
  }
}


class listView extends ListView{
@override
Widget build (BuildContext context){

return new     ListView(children: <Widget>[
new Container(
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 50),
      child: new Column(
        children: <Widget>[
      
new Container(
    color: Colors.white,
    height: 80,
              child: Align (
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  decoration: new BoxDecoration(
                    color: Colors.black,
                    borderRadius: new BorderRadius.all( Radius.circular(40.0),),
                    image: new DecorationImage(
                      image: new AssetImage('assets/img/drawable-xxxhdpi/mulher.png'),
      fit: BoxFit.cover,),
      ),
      height: 50,
      width: 50,
      ),),),

      new Container(

    color: Colors.white,
    height: 45,
              child: Align (
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 20),
                 child: Text("Descubra", style: TextStyle(fontSize: 25, color: Colors.black87, ),),
      ),
      ),
      ),
  new Container(
    height: 20,
    margin: const EdgeInsets.only(bottom: 20, left: 20),
    
    child: ListView(
      scrollDirection: Axis.horizontal,

      children: <Widget>[

                  
        new Text("Paisagens",  style: TextStyle(fontSize: 15, color: Colors.orange), ),
SizedBox(width: 20,),

        new Text("Lugares",  style: TextStyle(fontSize: 15, color: Colors.black54), ),
SizedBox(width: 20,),

        new Text("Comida",  style: TextStyle(fontSize: 15, color: Colors.black54), )
,

      ],
    ),
  ),  


  new Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    color: Colors.white,
    height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
            children: <Widget>[

ContainerPhoto("180"),
SizedBox(width: 20,),

ContainerPhoto("182"),
SizedBox(width: 20,),

ContainerPhoto("192"),


            ]
            )
            ),

 new Container(

    color: Colors.white,
    height: 45,
              child: Align (
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 20, top: 20),
                 child: Text("Seguindo", style: TextStyle(fontSize: 25, color: Colors.black87, ),),
      ),
      ),
      ),


      new PhotoFromPeople("1998"),
      new PhotoFromPeople("2145"),
      new PhotoFromPeople("1422"),
      new PhotoFromPeople("147"),
      new PhotoFromPeople("598"),
      new PhotoFromPeople("258"),
      new PhotoFromPeople("127"),
      new PhotoFromPeople("11"),
      new PhotoFromPeople("234"),
      new PhotoFromPeople("986"),
      new PhotoFromPeople("365"),
      new PhotoFromPeople("588"),



        ]
        
        )

      ), 

        ],);

} 
}