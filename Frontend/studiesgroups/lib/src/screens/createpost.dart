import 'package:flutter/material.dart';
import '../api/listall.dart';
import '../api/create.dart';
import 'newID.dart';

class Add extends StatelessWidget {
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
              "Título",
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
              "Descrição",
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
              "Link para contato",
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
                "    Criar Post    ",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await createPost(
                  controllerTitle.text,
                  controllerDescription.text,
                  controllerContact.text,
                );
                await getPosts();
                showID(context);
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
