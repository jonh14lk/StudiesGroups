import 'package:flutter/material.dart';
import 'post.dart';
import '../api/listall.dart';

BuildContext contextt;
List<Widget> cardList = [];
var imgCard = 'https://i.ytimg.com/vi/12g2t7G54nA/maxresdefault.jpg';

void construct() {
  cardList.clear();
  for (var i = 0; i < posts.length; i++) {
    String title = posts[i].title;
    String description = posts[i].description;

    if (posts[i].description.length > 100) {
      description = description.substring(0, 100) + '...';
    }

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
                    child: Text(title,
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
                      description,
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
                        getInfo(posts[i].title, posts[i].description,
                            posts[i].whatsapp, posts[i].id);
                        Navigator.pushNamed(contextt, '/showpost');
                      },
                      child: Text(
                        'See more',
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
    contextt = context;
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
