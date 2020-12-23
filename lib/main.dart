import 'package:flutter/material.dart';
import 'package:ftwitter/fleet_data.dart';

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
              flex: 7,
              child: Container(
                color: Colors.green,
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
      padding: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
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
