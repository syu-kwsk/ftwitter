import 'package:flutter/material.dart';
import 'package:ftwitter/fleet_data.dart';
import 'package:ftwitter/tweet_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu),
              Icon(Icons.android),
              Icon(Icons.bolt),
            ],
          ),
        ),

        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: FleetList(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: TimeLine(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print('add tweet'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'message',
            ),
          ],
        ),
      ),
    );
  }
}

class FleetList extends StatelessWidget {
  final List<Widget> fleetList = fleetDataList.map((fleet) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(fleet.photoUrl),
          ),
          Text(
            fleet.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: fleetList,
          ),
        ),
      ],
    );
  }
}

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tweetDataList.map((data) {
        final tweet = TweetCard(data: data);
        return tweet;
      }).toList(),
    );
  }
}

class TweetCard extends StatelessWidget {
  const TweetCard({
    Key key,
    this.data,
  }) : super();

  final TweetData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(data.photoUrl),
            radius: 30,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data.content,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              data.imageUrl != null ? Image.network(data.imageUrl) : Container(),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.chat_bubble_outline),
                    Text(data.reply.toString()),
                    Icon(Icons.repeat_outlined),
                    Text(data.reTweet.toString()),
                    Icon(Icons.favorite_outline),
                    Text(data.favorite.toString()),
                    Icon(Icons.share_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
