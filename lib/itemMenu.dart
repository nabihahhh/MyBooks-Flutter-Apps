import 'package:flutter/material.dart';
import 'ToggleState.dart';
import 'posts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  ItemState createState() => ItemState();
}

class ItemState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  List<Item> deviceItem = [
    Item(
      name: 'The Help',
      isOn: false,
      image: 'theHelp.jpg',
    ),
    Item(
      name: 'The Book Thief',
      isOn: false,
      image: 'bookThief.jpg',
    ),
    Item(
      name: 'The Plot',
      isOn: false,
      image: 'plot.jpg',
    ),
    Item(
      name: 'Jane Eyre',
      isOn: false,
      image: 'jane.jpg',
    ),
    Item(
      name: 'The Great Gatsby',
      isOn: false,
      image: 'gatsby.jpg',
    ),
    Item(
      name: 'Little Woman',
      isOn: false,
      image: 'woman.jpg',
    ),
  ];

  void toggleState(String name) {
    int deviceIndex = deviceItem.indexWhere((device) => device.name == name);
    if (deviceIndex != -1) {
      setState(() {
        deviceItem[deviceIndex].isOn = !deviceItem[deviceIndex].isOn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookRead',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('MyBooks'),
            bottom: TabBar(
              indicatorColor: Colors.amberAccent,
              indicatorWeight: 10,
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(text: 'List'),
                Tab(text: 'Details'),
              ],
            ),
          ),
          body: TabBarView(children: [
            AppTab(deviceItem, toggleState),
            PostsPage(),
          ]),
        ),
      ),
    );
  }
}
