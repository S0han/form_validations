import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

//Define a custom Form widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

//Define a corresponding State class.
//This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  //Create a global key that uniquely identifies the Form widget
  //and allows validation of the form
  //
  //Note: This is a GlobaKey<FormState>
  //not a GlobalKey<MyCustomFormState>
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Build a Form widget using _formKey created above
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            //The validator recieves the text that the user has entered
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              //validate returns true if the form is valid, of false otherwise
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
