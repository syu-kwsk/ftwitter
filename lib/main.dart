import 'package:flutter/material.dart';

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
      body: ListView(
        children: List.generate(5, (index) {
          return InkWell(
            onTap: () {
              print("Tapped!");
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
    );
  }
}
