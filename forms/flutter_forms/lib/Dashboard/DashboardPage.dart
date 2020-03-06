import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'VitalsList.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();

}

class DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{

  int _currentIndex = 0;
  TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }


  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void onTabTapped(index){

      setState(() {
        debugPrint("_currentIndex= $index");
        _currentIndex=index;
      });

    }
    return
        Scaffold(
        appBar:AppBar(title:Text("Home")),
        body: TabBarView(children: <Widget>[VitalsList(),VitalsList(),VitalsList()],
        controller: tabController,
        ),

        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
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