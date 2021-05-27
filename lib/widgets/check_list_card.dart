import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';

import 'check_list_item.dart';

class CheckListCard extends StatelessWidget {
  final String checkListName;
  final String title;
  final String input;
  final int itemCount;
  CheckListCard({this.checkListName, this.input, this.title, this.itemCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Check List',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return CheckListItem(
                    checkListName: checkListName, title: title, input: input);
              },
              itemCount: itemCount,
            ),
          )
        ],
      ),
    );
  }
}
