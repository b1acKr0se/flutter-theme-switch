library theme_switch;

import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final double width, height;

  ThemeSwitch(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.onChanged})
      : super(key: key);

  @override
  ThemeSwitchState createState() => ThemeSwitchState();
}

class ThemeSwitchState extends State<ThemeSwitch> {
  int currentState = 0;

  void onTap() {
    int newState = currentState == 0 ? 1 : 0;
    setState(() {
      currentState = newState;
    });
    widget.onChanged(newState);
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width, height = widget.height, padding = 4;
    double toggleRadius = width / 2 - padding * 2;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(height / 2)),
            ),
            Positioned.fill(
              left: 11,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedOpacity(
                  opacity: currentState == 0 ? 0 : 1,
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              right: 11,
              child: Align(
                alignment: Alignment.centerRight,
                child: AnimatedOpacity(
                  opacity: currentState == 0 ? 1 : 0,
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    Icons.brightness_3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              top: padding,
              left: currentState == 0
                  ? padding
                  : width - padding - toggleRadius,
              child: Container(
                width: toggleRadius,
                height: toggleRadius,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(toggleRadius / 2)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
