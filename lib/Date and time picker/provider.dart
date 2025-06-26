// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateAndTimeProvider =
    StateNotifierProvider<DateAndTimeNotifier, DateAndTime>(
      (ref) => DateAndTimeNotifier(),
    );

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);

final textControllerProvider = Provider<TextEditingController>((ref) {
  final TextEditingController controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

class DateAndTime {
  final DateTime? date;
  final TimeOfDay? time;
  DateAndTime({this.date, this.time});

  DateAndTime copyWith({DateTime? date, TimeOfDay? time}) {
    return DateAndTime(date: date ?? this.date, time: time ?? this.time);
  }
}

class DateAndTimeNotifier extends StateNotifier<DateAndTime> {
  DateAndTimeNotifier() : super(DateAndTime());
  // DateTime? selectedDate;
  // TimeOfDay? selectedTime;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null
    //  && pickedDate != selectedDate
    ) {
      state = state.copyWith(date: pickedDate);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null
    // && pickedTime != selectedTime
    ) {
      // selectedTime = pickedTime;
      state = state.copyWith(time: pickedTime);
    }
  }
}

class Task {
  final String task;
  final DateTime? date;
  final TimeOfDay? time;
  Task({required this.task, this.date, this.time});
}

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }
  // void addTask(String task, DateTime? date, TimeOfDay? time) {
  // if (task.isNotEmpty && date != null && time != null) {
  // final newTask = Task(task: task, date: date, time: time);
  // state = [...state, newTask];
  // }
  // }

  void deleteTask(int index) {
    if (index >= 0 && index < state.length) {
      final updateList = [...state..removeAt(index)];
      state = updateList;
    }
  }
}
