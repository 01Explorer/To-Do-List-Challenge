import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/dao/task_entity_dao.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/theme_manager_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/layers/presentation/themes/app_theme.dart';
import 'package:to_do_list_challenge/locator.dart';

late Box<TaskEntity> localTasksStorage;
void main() async {
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityDaoAdapter());
  localTasksStorage = await Hive.openBox<TaskEntity>('localTasksStorage');
  runApp(const MyApp());
}

ThemeManagerController _themeManagerController =
    locator.get<ThemeManagerController>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeManagerController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeToDoLight,
          darkTheme: themeToDoDark,
          themeMode: _themeManagerController.themeMode,
          home: const HomeTaskPage(),
        );
      },
    );
  }
}
