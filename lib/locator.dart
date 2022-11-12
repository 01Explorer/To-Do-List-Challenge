import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/create_tasks/create_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/delete_tasks/delete_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/edit_tasks/edit_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/filter_tasks_by_date_between/filter_tasks_by_date_between_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/filter_tasks_by_title/filter_tasks_by_title_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/get_completed_tasks/get_completed_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/get_incomplete_tasks/get_incomplete_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/mark_a_task_as_done/mark_a_task_as_done_repository_imp.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/create_tasks/create_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/delete_tasks/delete_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/edit_tasks/edit_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/filter_tasks_by_date_between/filter_tasks_by_date_between_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/filter_tasks_by_title/filter_tasks_by_title_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/get_completed_tasks/get_completed_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/get_incomplete_tasks/get_incomplete_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/mark_a_task_as_done/mark_a_task_as_done_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/delete_tasks/delete_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/delete_tasks/delete_tasks_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/edit_tasks/edit_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/edit_tasks/edit_tasks_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/filter_tasks_by_date_between/filter_tasks_by_date_between_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/filter_tasks_by_date_between/filter_tasks_by_date_between_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/filter_tasks_by_title/filter_tasks_by_title_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/filter_tasks_by_title/filter_tasks_by_title_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/get_completed_tasks/get_completed_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/get_completed_tasks/get_completed_tasks_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/get_incomplete_tasks/get_incomplete_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/get_incomplete_tasks/get_incomplete_tasks_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/mark_a_task_as_done/mark_a_task_as_done_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/mark_a_task_as_done/mark_a_task_as_done_usecase_imp.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

import 'main.dart';

final locator = GetIt.instance;

void setup() {
  // Repositories
  locator.registerLazySingleton<CreateTasksRepository>(
      () => CreateTasksRepositoryImp(locator()));
  locator.registerLazySingleton<DeleteTasksRepository>(
      () => DeleteTasksRepositoryImp(locator()));
  locator.registerLazySingleton<EditTasksRepository>(
      () => EditTasksRepositoryImp(locator()));
  locator.registerLazySingleton<FilterTasksByDateBetweenRepository>(
      () => FilterTasksByDateBetweenRepositoryImp(locator()));
  locator.registerLazySingleton<FilterTasksByTitleRepository>(
      () => FilterTasksByTitleRepositoryImp(locator()));
  locator.registerLazySingleton<MarkATaskAsDoneRepository>(
      () => MarkATaskAsDoneRepositoryImp(locator()));
  locator.registerLazySingleton<GetIncompleteTasksRepository>(
      () => GetIncompleteTasksRepositoryImp(locator()));
  locator.registerLazySingleton<GetCompletedTasksRepository>(
      () => GetCompletedTasksRepositoryImp(locator()));
  // Usecases
  locator.registerLazySingleton<CreateTasksUsecase>(
      () => CreateTasksUsecaseImp(locator()));
  locator.registerLazySingleton<DeleteTasksUsecase>(
      () => DeleteTasksUsecaseImp(locator()));
  locator.registerLazySingleton<EditTasksUsecase>(
      () => EditTasksUsecaseImp(locator()));
  locator.registerLazySingleton<FilterTasksByDateBetweenUsecase>(
      () => FilterTasksByDateBetweenUsecaseImp(locator()));
  locator.registerLazySingleton<FilterTasksByTitleUsecase>(
      () => FilterTasksByTitleUsecaseImp(locator()));
  locator.registerLazySingleton<MarkATaskAsDoneUsecase>(
      () => MarkATaskAsDoneUsecaseImp(locator()));
  locator.registerLazySingleton<GetIncompleteTasksUsecase>(
      () => GetIncompleteTasksUsecaseImp(locator()));
  locator.registerLazySingleton<GetCompletedTasksUsecase>(
      () => GetCompletedTasksUsecaseImp(locator()));
  // Controllers
  locator.registerLazySingleton<TaskController>(() => TaskController(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator()));
  locator.registerLazySingleton<HomeController>(() => HomeController());
  // Hive Box
  locator.registerLazySingleton<Box<TaskEntity>>(() => localTasksStorage);
}
