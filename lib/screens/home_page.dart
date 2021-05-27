import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';
import 'package:tulu_project/widgets/app_bar.dart';
import 'package:tulu_project/widgets/check_list_card.dart';
import 'package:tulu_project/widgets/task_card.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: myAppBar(),
        body: Container(
          padding: const EdgeInsets.only(top: 28.0, left: 12.0, right: 12.0),
          child: Column(
            children: [
              TaskCard(),
              SizedBox(
                height: 24.0,
              ),
              CheckListCard()
            ],
          ),
        ),
      ),
    );
  }
}
