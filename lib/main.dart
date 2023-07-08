import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(AnimatedTabBar());
}

class AnimatedTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late Color _activeColor;
  Color _mainColor = Colors.white;
  List<Color> iconColors = [
    Colors.yellow[400]!,
    Colors.green[400]!,
    Colors.blue,
    Colors.red[400]!,
    Colors.purple
  ];

  var _index = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 56,
      decoration: BoxDecoration(
          color: Color(0xff1f1b2c), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              _index = 1;
              setState(() {});
            },
            child: Icon(
              Icons.home,
              color: _index != 1 ? Colors.white : iconColors[_index - 1],
            ),
          ),
          GestureDetector(
            onTap: () {
              _index = 2;
              setState(() {});
            },
            child: Icon(
              Icons.line_axis,
              color: _index != 2 ? Colors.white : iconColors[_index - 1],
            ),
          ),
          GestureDetector(
            onTap: () {
              _index = 3;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              width: _index == 3 ? 26 : 24,
              height: _index == 3 ? 26 : 24,
              decoration: BoxDecoration(
                color: _index != 3 ? Colors.white : iconColors[_index - 1],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: _index == 1
                  ? EdgeInsets.only(right: 4)
                  : _index == 2
                      ? EdgeInsets.only(right: 2)
                      : _index == 3
                          ? EdgeInsets.only(right: 0)
                          : _index == 4
                              ? EdgeInsets.only(left: 2)
                              : EdgeInsets.only(left: 4),
              child: Image.asset(
                'assets/face.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _index = 4;
              setState(() {});
            },
            child: Icon(
              Icons.notifications,
              color: _index != 4 ? Colors.white : iconColors[_index - 1],
            ),
          ),
          GestureDetector(
            onTap: () {
              _index = 5;
              setState(() {});
            },
            child: Icon(
              Icons.search,
              color: _index != 5 ? Colors.white : iconColors[_index - 1],
            ),
          ),
        ],
      ),
    );
  }
}
