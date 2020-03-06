import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/Models/VitalItem.dart';

class VitalCard extends StatelessWidget {

  final VitalItem vitalItem;
  const VitalCard({Key key,this.vitalItem}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10.0),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,

      child: Container(
        height: 130,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          image: DecorationImage(
            image: AssetImage(vitalItem.bgImage),
            fit: BoxFit.fill,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child:              Container(
            margin: EdgeInsets.only(top: 70),
            alignment: Alignment.center,
            child:Text(vitalItem.name, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
      ),
//      child: Stack(
//          children: <Widget>[
//             Center(child:Image(image: AssetImage(vitalItem.bgImage))),

//          ]
//      ),
    );
  }



}