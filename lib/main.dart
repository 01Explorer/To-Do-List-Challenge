import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/dao/task_entity_dao.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/land_page_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/theme_manager_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/land/land_page_first.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/land/land_page_logged.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/layers/presentation/themes/app_theme.dart';
import 'package:to_do_list_challenge/locator.dart';

late Box<TaskEntity> localTasksStorage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityDaoAdapter());
  localTasksStorage = await Hive.openBox<TaskEntity>('localTasksStorage');
  locator.isReady<SharedPreferences>().then((_) async {
    runApp(const MyApp());
  });
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
        return ScreenUtilInit(
          designSize: const Size(360, 640),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: themeToDoLight,
              darkTheme: themeToDoDark,
              themeMode: _themeManagerController.themeMode,
              home: locator.get<LandPageController>().getUser() != null
                  ? LandPageLogged(
                      controller: locator(),
                    )
                  : LandPage(
                      controller: locator(),
                    ),
            );
          },
        );
      },
    );
  }
}
