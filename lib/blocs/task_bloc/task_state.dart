import 'package:tulu_project/models/task_model.dart';

abstract class TaskState {
  const TaskState();
}

class TaskInitialState extends TaskState {
  const TaskInitialState();
}

class TaskInProgressState extends TaskState {
  const TaskInProgressState();
}

class TaskCompletedState extends TaskState {
  const TaskCompletedState({this.taskList});

  final List<TaskModel> taskList;
}

class TasktStateFailure extends TaskState {
  const TasktStateFailure(this.error);

  final String error;
}
