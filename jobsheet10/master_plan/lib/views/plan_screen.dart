import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ganti ‘Namaku' dengan Nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plan Hafizh Muhammad Rabbani')),
      body: ListView.builder(
        controller: scrollController,
        keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
            ? ScrollViewKeyboardDismissBehavior.onDrag
            : ScrollViewKeyboardDismissBehavior.manual,
        itemCount: plan.tasks.length, // Pastikan ini sesuai dengan data tasks
        itemBuilder: (context, index) {
          return _buildTaskTile(plan.tasks[index], index);
        },
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // Fungsi untuk menambahkan task baru
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }

  // Fungsi untuk menampilkan task dalam list
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan.tasks[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan.tasks[index] = Task(
              description: text,
              complete: task.complete,
            );
          });
        },
      ),
    );
  }
}
