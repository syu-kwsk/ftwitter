import 'package:flutter/material.dart';

void main() => runApp(TweetForm());

class TweetForm extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'TweetForm'),
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
  String m_inputedValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            // 入力用テキストボックス
            TextField(
              //改行できるようにするおまじない
              keyboardType: TextInputType.multiline,
              maxLines: null,
              //改行のおまじない終わり
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "新しいツイート",
                hintText: "いまなにしてる？",
              ),

              // 最大入力可能文字数
              maxLength: 140,


            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ツイートしたときに発生することを書く
        },
        child: Icon(Icons.send),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}