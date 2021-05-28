import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';

Widget myAppBar() {
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20.0),
      ),
    ),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      'Task information',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.mainColor,
      ),
    ),
    leading: Icon(
      Icons.keyboard_arrow_left,
      color: AppColors.mainColor,
      size: 28.0,
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Image(
          width: 24.0,
          height: 24.0,
          image: AssetImage(
            'assets/icons/question.png',
          ),
        ),
      )
    ],
  );
}
