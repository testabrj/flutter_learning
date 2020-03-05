import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/PageTwo.dart';
import 'package:google_fonts/google_fonts.dart';

class PageOne extends StatefulWidget {


  @override
  AnimatedContainerState createState() => AnimatedContainerState();

}

class AnimatedContainerState extends State<PageOne> {

  Color _color = Colors.green;
  double _width = 50;
  double _height = 50;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
             opacity: _visible?1.0:0.0,
            duration: Duration(milliseconds: 500),
            child:AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius:_borderRadius
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),

          ),
          RaisedButton(
              child: Text('Go!',
                style: GoogleFonts.lato(),
              ),
              onPressed: (){
                Navigator.of(context).push(_createRoute());
          }),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[

          FloatingActionButton(

            child: Icon(Icons.play_arrow),
            onPressed: (){

              setState(() {
                final random = Random();
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();
                _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
                _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());


              });
            }),
          FloatingActionButton(
            tooltip: 'Toggle Opacity',
            child: Icon(Icons.flip),
            onPressed: (){
              setState(() {
                _visible = !_visible;
              });
            }
          )]
          )
        ],
      ),
      ),
    );
  }
}

Route _createRoute(){

  return PageRouteBuilder(
    pageBuilder: (context,animation,secondaryAnimation)=>PageTwo(),
      transitionsBuilder: (context,animation,secondaryAnimation,child){

        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));


        return SlideTransition(position: animation.drive(tween),
        child: child);
      }
  );

}