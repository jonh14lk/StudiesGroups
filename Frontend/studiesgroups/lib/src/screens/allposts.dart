import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/listall.dart';

List<Widget> cardList = [];
var imgCard =
    'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&w=1000&q=80';

void construct() {
  cardList.clear();
  for (var i = 0; i < posts.length; i++) {
    var cardItem = ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(imgCard, fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(posts[i].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      posts[i].description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () async {
                        await launch(posts[i].whatsapp);
                      },
                      child: Text(
                        'Contato',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF2d3447),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    var sbox = SizedBox(
      height: 30.0,
    );
    cardList.add(cardItem);
    cardList.add(sbox);
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "StudiesGroups",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: cardList,
                ),
              ]),
        ),
      ),
    );
  }
}
