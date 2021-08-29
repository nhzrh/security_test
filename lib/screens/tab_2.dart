import 'package:flutter/material.dart';
import 'package:security_test/common/route_generator.dart';

class TabTwo extends StatefulWidget {
  final String title;
  const TabTwo({Key key, this.title}) : super(key: key);

  @override
  _TabTwoState createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Hello from ${widget.title ?? ''}"),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.network),
              child: Text("Go to Network example"),
            )
          ],
        ),
      ),
    );
  }
}