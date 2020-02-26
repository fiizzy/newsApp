import 'dart:convert';
import 'package:flutter/material.dart';
import '../util/util.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  void showStuff() async {
    Map data = await getNews(util.apiKey, util.defaultCountry);
    print(data.toString());
  }
 String _cityEntered;
  @override
  Widget build(BuildContext context) {
    Future _goToNextScreen(BuildContext context) async {
      Map results = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChangeCity()));

      if (results != null && results.containsKey('enter')) {
        _cityEntered = results['enter'];

//      debugPrint("From First screen" + results['enter'].toString());

      }
    }

    return Scaffold(
        appBar: AppBar(
            title: const Text('News App'),
            centerTitle: true,
            actions: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // _goToNextScreen(context);
                      showStuff();
                    }),
              )
            ]),
        body: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  "Headlines",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: CarouselSlider(
                  // items: items,
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: new Image.asset(
                              "img/one.jpg",
                              height: 20.0,
                              fit: BoxFit.fitHeight,
                            ));
                      },
                    );
                  }).toList(),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 10),
                child: Text(
                  "Latest News",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )),
            new Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 150.0),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: new Image.asset(
                                "img/one.jpg",
                                height: 20.0,
                                fit: BoxFit.fitHeight,
                              ))),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Other healine from the API",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                          Container(
                              width: 300,
                              child: Text(
                                "The news details from the API goes here and  more",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ))
                        ])
                  ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 150.0),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: new Image.asset(
                                "img/one.jpg",
                                height: 20.0,
                                fit: BoxFit.fitHeight,
                              ))),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Other healine from the API",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                          Container(
                              width: 300,
                              child: Text(
                                "The news details from the API goes here and  more",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ))
                        ])
                  ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 150.0),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: new Image.asset(
                                "img/one.jpg",
                                height: 20.0,
                                fit: BoxFit.fitHeight,
                              ))),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Other healine from the API",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                          Container(
                              width: 300,
                              child: Text(
                                "The news details from the API goes here and  more",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ))
                        ])
                  ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 150.0),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: new Image.asset(
                                "img/one.jpg",
                                height: 20.0,
                                fit: BoxFit.fitHeight,
                              ))),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Other healine from the API",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                          Container(
                              width: 300,
                              child: Text(
                                "The news details from the API goes here and  more",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ))
                        ])
                  ])
            ])
          ],
        ));
  }

   Widget updateNewsWidget(String country) {
    return new FutureBuilder(
        future: getNews(util.apiKey, country == null ? util.defaultCountry : country),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          //where we get all of the json data, we setup widgets etc.
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
            );
          } else {
            return new Container();
          }
        });
  }
}

class ChangeCity extends StatelessWidget {
  var _cityFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text('Change City'),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: Text(
              "Other healine from the API",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter City',
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                    onPressed: () {
                      Navigator.pop(
                          context, {'enter': _cityFieldController.text});
                    },
                    textColor: Colors.white70,
                    color: Colors.blueAccent,
                    child: new Text('Get Weather')),
              )
            ],
          )
        ],
      ),
    );
  }
}

Future<Map> getNews(String apiKey, String country) async {
  String apiUrl = "http://newsapi.org/v2/top-headlines?$country=us&$apiKey";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

//aogundijo@sbsc.com
