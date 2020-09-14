import 'package:flutter/material.dart';
import '../api/listall.dart';
import '../api/find.dart';
import '../api/update.dart';
import 'allposts.dart';

String id;

class Update extends StatelessWidget {
  final controllerID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        elevation: 0,
        backgroundColor: Color(0xFF2d3447),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "ID of the post you want to edit",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Container(
              child: TextField(
                controller: controllerID,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              child: Text(
                "    Edit post    ",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                bool ret = await findPost(controllerID.text);
                if (ret == false) {
                  showMessage(context, "The post does not exist");
                } else {
                  id = controllerID.text;
                  Navigator.pushNamed(context, '/updatedata');
                }
              },
              color: Colors.teal,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateData extends StatelessWidget {
  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerContact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        elevation: 0,
        backgroundColor: Color(0xFF2d3447),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Title",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Container(
              child: TextField(
                controller: controllerTitle,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Container(
              child: TextField(
                controller: controllerDescription,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Contact link",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Container(
              child: TextField(
                controller: controllerContact,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              child: Text(
                "    Save Post    ",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                bool ret = await updatePost(
                  controllerTitle.text,
                  controllerDescription.text,
                  controllerContact.text,
                  id,
                );
                if (ret == true) {
                  await getPosts();
                  construct();
                  showMessage(context, "Post edited successfully!");
                } else {
                  showMessage(context, "The post cannot be edited");
                }
              },
              color: Colors.teal,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ],
        ),
      ),
    );
  }
}

showMessage(BuildContext context, String message) {
  AlertDialog popup = AlertDialog(
    backgroundColor: Color(0xFF2d3447),
    title: SelectableText(
      message,
      style: TextStyle(
        color: Colors.teal,
      ),
    ),
    actions: [
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return popup;
    },
  );
}
