import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> info = [];

class ShowPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xFF2d3447),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.teal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    info[0],
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2d3447),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 450,
                child: Text(
                  info[1],
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.teal,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text(
                "Get in touch",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await launch(info[2]);
              },
              color: Colors.teal,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

void getInfo(
  String title,
  String des,
  String whatsapp,
  String id,
) {
  info.clear();
  info.add(title);
  info.add(des);
  info.add(whatsapp);
  info.add(id);
}
