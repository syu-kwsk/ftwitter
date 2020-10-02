import 'package:flutter/material.dart';

import 'package:ftwitter/tweetForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ftwitter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePageDetail("assets/picture$index.jpg")));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/picture$index.jpg"),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text("picture$index.jpg"),
                        leading: Icon(Icons.person),
                        subtitle: Text("サブタイトル"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TweetForm();
              },
            ),
          );
        },
        child: Icon(Icons.chat_bubble),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
class MyHomePageDetail extends StatefulWidget {

  MyHomePageDetail(this._imageName);
  final String _imageName;

  @override
  _MyHomePageDetailState createState() => new _MyHomePageDetailState(_imageName);
}

class _MyHomePageDetailState extends State<MyHomePageDetail> {

  _MyHomePageDetailState(this._imageName);
  final String _imageName;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Material App"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(_imageName),
              Container(
                child: ListTile(
                  title: Text(_imageName),
                  leading: Icon(Icons.person),
                  subtitle: Text("Aは美しい"),
                ),
              )
            ],
          ),
        ));
  }
}
