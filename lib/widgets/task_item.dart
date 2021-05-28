import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String icon;
  final String description;
  final Color textColor;
  TaskItem({this.description, this.icon, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon != null
              ? Image(
                  height: 20,
                  width: 20,
                  image: AssetImage(
                    icon,
                  ),
                )
              : SizedBox(
                  width: 20,
                ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
