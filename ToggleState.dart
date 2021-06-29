import 'package:flutter/material.dart';

class Item {
  String name;
  String image;
  bool isOn;

  Item({
    this.name = "",
    this.image = "",
    this.isOn = true,
  });
}

class AppTab extends StatelessWidget {
  final List<Item> deviceItem;
  final Function onToggle;

  AppTab(this.deviceItem, this.onToggle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey, Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 1.1,
        children: deviceItem
            .map((deviceItem) => Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9.0),
                            child: Image.asset(
                              'web/icons/${deviceItem.image}',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          onTap: () => onToggle(deviceItem.name),
                        ),
                        Spacer(),
                        if (deviceItem.isOn)
                          Icon(Icons.library_add_check_rounded,
                              color: Colors.green, size: 50.0),
                        if (!deviceItem.isOn)
                          Icon(Icons.library_add_rounded,
                              color: Colors.blue, size: 50.0),
                      ]),
                      Spacer(),
                      Text(deviceItem.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.0),
                      Text(
                        '${deviceItem.isOn ? 'Book Added To Bookshelf!' : ''}',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: deviceItem.isOn ? Colors.teal : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
