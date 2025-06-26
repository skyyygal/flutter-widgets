import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:understanding_widgets/Date%20and%20time%20picker/provider.dart';

class DateTimePicker extends ConsumerWidget {
  const DateTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateAndTimeProvider.select((d) => d.date));
    final selectedTime = ref.watch(dateAndTimeProvider.select((d) => d.time));
    final textController = ref.watch(textControllerProvider);
    // final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Task Scheduler App")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.2))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Consumer(
                        //   builder: (context, ref, child) {
                        //     final selectedDate = ref.watch(dateAndTimeProvider);
                        // return
                        Text(
                          selectedDate == null
                              ? "Select a Date"
                              : "Date ${DateFormat.yMd().format(selectedDate)}",
                          style: TextStyle(fontSize: 18),
                          // ),
                          // },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // selectDate(context);
                            ref
                                .watch(dateAndTimeProvider.notifier)
                                .selectDate(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text("Select Date"),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        // Consumer(
                        //   builder: (context, ref, child) {
                        //     final selectedTime = ref.watch(dateAndTimeProvider);

                        //     return
                        Text(
                          selectedTime == null
                              ? "Select a time"
                              : "Time ${selectedTime.format(context)}",
                          style: TextStyle(fontSize: 18),
                          // );
                          // },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          onPressed: () {
                            ref
                                .watch(dateAndTimeProvider.notifier)
                                .selectTime(context);
                            // selectTime(context);
                          },
                          child: Text("Select Time"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2)),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: "Enter Task",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (selectedTime != null &&
                    selectedDate != null &&
                    textController.text.isNotEmpty) {
                  ref
                      .read(taskProvider.notifier)
                      .addTask(
                        Task(
                          task: textController.text,
                          date: selectedDate,
                          time: selectedTime,
                        ),
                      );
                }
                textController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text("Add Task", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 30),
            //Displaying task on screen
            Consumer(
              builder: (context, ref, child) {
                final taskList = ref.watch(taskProvider);
                return taskList.isEmpty
                    ? Text(
                        "No Tasks Added",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          final task = taskList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  task.task,

                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "${DateFormat.yMd().format(task.date!)} at ${task.time!.format(context)}",
                                  // "${DateFormat.yM().format(task["date"])} at ${task["time"].format(context)}",
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(taskProvider.notifier)
                                        .deleteTask(index);
                                  },
                                  icon: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final List<Map<String, dynamic>> tasks = [];
  final TextEditingController taskController = TextEditingController();
  //Select Date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // select time
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void addTask() {
    if (selectedDate != null &&
        selectedTime != null &&
        taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({
          //Mapping the task and storing it inside the tasks - List
          "date": selectedDate,
          "time": selectedTime,
          "task": taskController.text,
        });
      });
      taskController.clear();
    }
    void deleteTask(int index) {
      if (tasks.isNotEmpty) {
        tasks.removeAt(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Scheduler App")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.2))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? "Select a Date"
                              : "Date ${DateFormat.yMd().format(selectedDate!)}",
                          style: TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            selectDate(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text("Select Date"),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          selectedTime == null
                              ? "Select a time"
                              : "Time ${selectedTime!.format(context)}",
                          style: TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          onPressed: () {
                            selectTime(context);
                          },
                          child: Text("Select Time"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2)),
              child: TextFormField(
                controller: taskController,
                decoration: InputDecoration(
                  labelText: "Enter Task",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                addTask();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text("Add Task", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 30),
            //Displaying task on screen
            tasks.isEmpty
                ? Text(
                    "No Tasks Added",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(color: Colors.blue.withOpacity(0.2)),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              task["task"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${DateFormat.yM().format(task["date"])} at ${task["time"].format(context)}",
                            ),
                            // trailing: IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(Icons.delete),
                            // ),
                            trailing: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
 */
