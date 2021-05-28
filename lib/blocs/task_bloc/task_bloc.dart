import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulu_project/blocs/task_bloc/task_state.dart';
import 'package:tulu_project/models/task_model.dart';
import 'package:http/http.dart' as http;

class TaskBloc extends Cubit<TaskState> {
  TaskBloc() : super(TaskInitialState());
  var taskList = List<TaskModel>();

  void taskGetData() async {
    try {
      if (state is TaskCompletedState) {
        return;
      }

      emit(TaskInProgressState());

      final response =
          await http.get(Uri.parse('http://papi.wipehero.com/task.json'));

      Iterable list = json.decode(response.body);
      taskList = list.map((model) => TaskModel.fromJson(model)).toList();

      emit(TaskCompletedState(taskList: taskList));
    } catch (e) {
      print('-----> ' + e.toString());
      emit(TasktStateFailure(e));
    }
  }
}
