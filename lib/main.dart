import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/dao/task_entity_dao.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/locator.dart';

late Box<TaskEntity> localTasksStorage;
void main() async {
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityDaoAdapter());
  localTasksStorage = await Hive.openBox<TaskEntity>('localTasksStorage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomeTaskPage(),
    );
  }
}
