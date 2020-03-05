import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();

}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        Scaffold(
        appBar:AppBar(title:Text("Home")),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: [

               BottomNavigationBarItem(
                 icon: new Icon(Icons.home),
                 title: Text("Home")
               ),
               BottomNavigationBarItem(
                   icon: new Icon(Icons.chrome_reader_mode),
                   title: Text("Vitals")
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.message),
                   title: Text("Messages")
               )
            ]),

        );

  }


}