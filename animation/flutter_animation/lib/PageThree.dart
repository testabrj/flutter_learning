
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  LoginFormState createState() {
    // TODO: implement createState
    return LoginFormState();
  }




}

class LoginFormState extends State<PageThree> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            initialValue: "Enter your Name",
            validator:(value){

              if(value.isEmpty){
                return 'Please Enter some text';
              }
              return null;
            } ,

          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
          
          child: RaisedButton(onPressed: (){
            if(_formKey.currentState.validate()){
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing")));
            }

          },child: Text("Submit"),
          ),
          ),

        ],
      ),
    );
  }
}