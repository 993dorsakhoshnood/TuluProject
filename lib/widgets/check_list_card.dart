import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';

class CheckListCard extends StatelessWidget {
  final Widget listview;
  CheckListCard({this.listview});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 64.0,
            decoration: BoxDecoration(
              color: AppColors.widgetsColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                'Check List',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 19),
              ),
            ),
          ),
          listview
        ],
      ),
    );
  }
}
