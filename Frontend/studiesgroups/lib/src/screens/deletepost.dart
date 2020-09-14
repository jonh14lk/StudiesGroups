import 'package:flutter/material.dart';
import '../api/listall.dart';
import 'allposts.dart';
import '../api/delete.dart';

class Delete extends StatelessWidget {
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
              "ID of the post you want to delete",
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
                "    Erase post    ",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                bool ret = await deletePost(controllerID.text);
                await getPosts();
                if (ret == true) {
                  showPopup(context, "Post deleted successfully!");
                } else {
                  showPopup(context, "The post cannot be deleted");
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

showPopup(BuildContext context, String message) {
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
          construct();
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
