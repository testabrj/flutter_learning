import 'package:flutter/cupertino.dart';
import 'package:flutter_forms/Models/VitalItem.dart';

import '../constants.dart';
import 'VitalCard.dart';

class VitalsList extends StatefulWidget {
  
  @override
  VitalListState createState() => VitalListState();
  
}


class VitalListState extends State<VitalsList>{

   List<VitalItem> vitalItems =  <VitalItem>[
    VitalItem(name:"Blood Pressure",bgImage: bloodPressure),
     VitalItem(name:"Blood Glucose",bgImage: bloodGlucose),
     VitalItem(name:"Blood Oxygen",bgImage: bloodOxygen),
     VitalItem(name:"Body Temperature",bgImage: bodyTemperature),
     VitalItem(name:"Body Weight",bgImage: bodyWeight),


  ];



  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(crossAxisCount: 2,
      children: List.generate(vitalItems.length,(index){
        return Center(
          child:VitalCard(vitalItem:vitalItems[index])
        );

      })

    );
  }
  
}