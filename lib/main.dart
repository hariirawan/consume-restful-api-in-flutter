import 'package:flutter/material.dart';
import 'package:rest_api_flutter/model/model_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("REST API IN FLUTTER"),
        ),
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Belajar REST API in Flutter"),
              SizedBox(
                height: 20,
              ),
              Text(
                (user != null) ? user.name + " | " + user.job : "Data Kosong !",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 90),
              RaisedButton(
                onPressed: () {
                  User.postUser("Hari Irawan", "Mobile Developer")
                      .then((value) => {user = value, setState(() {})});
                },
                child: Text("Post Data"),
              )
            ],
          )),
        ),
      ),
    );
  }
}
