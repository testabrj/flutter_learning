import 'package:flutter/material.dart';
import 'package:flutter_forms/constants.dart';


class LoginPage extends StatefulWidget{

  LoginPage({this.title}) : super();
  final String title;
  @override
  LoginPageState createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(title: Text(widget.title)) ,
        body:Form(
      key: _formKey,
      child:Center( child:Card(
        margin: EdgeInsets.all(16),
         elevation: 5,
        child:
         Column(

        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          Padding(padding: EdgeInsets.all(10),
          child:TextFormField(

              decoration: InputDecoration(hintText: "Enter your name",labelText: "Username*"),
              validator: (value){
                if(value.isEmpty){
                  return 'Please Enter a Name';
                }
                return null;
          })),
          Padding( padding:EdgeInsets.only(left: 10,right: 10,bottom: 10),child:TextFormField(
              decoration: InputDecoration(hintText: "Enter Password",labelText: "Password*"),
              validator: (value){
            if(value.isEmpty){
              return 'Please Enter a Password';
            }
            return null;

          })),
          Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Builder(builder: (context)=> RaisedButton(
              color: Colors.blue,
              padding: EdgeInsets.all(10),
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing data")));
                  Navigator.of(context).pushNamed(dashboardPageTag);
                }
              },
              child: Text("submit",style: TextStyle(color: Colors.white,fontSize: 16),),
              )
          )),

        ],
      ) ,

       )
        )
        )
    );
  }
}