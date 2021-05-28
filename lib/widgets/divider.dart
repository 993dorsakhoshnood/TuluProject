import 'package:flutter/material.dart';

class TaskDivider extends StatelessWidget {
  final double padding;
  TaskDivider({this.padding=4.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xffEAEAF4).withOpacity(1),
            Color(0xFFFFFFFF).withOpacity(0),
          ],
        ),
      ),
    );
  }
}
