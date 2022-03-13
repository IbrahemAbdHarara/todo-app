import 'package:bloc/bloc.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archived_tasks/archived_tasks_screene.dart';
import '../../modules/done_tasks/done_tasks_screene.dart';
import '../../modules/new_tasks/new_tasks_screene.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screene = [
    NewTasksScreene(),
    doneTasksScreene(),
    ArchivedTasksScreene()
  ];

  List<String> titles = ['New Tasks ', 'done Tasks', 'Archived Tasks'];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map> newTasks = []; //اعبي البيانات فيه
  List<Map> doneTasks = []; //اعبي البيانات فيه
  List<Map> archivedTasks = []; //اعبي البيانات فيه

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error when Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        //عشان اخد البيانات واعرضه للناس
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState()); //عشان انا خلصة
    });
  }

/*
first :
بكون
AppInitialState بد تعريف >> AppCreateDatabaseState خلصه بعدين راح >> AppGetDatabaseState
*/

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time","new")')
          .then((value) {
        print('$value iserted successfully');
        emit(AppInsertDatabaseState()); //iserted عشان اعرفه اني خصصة
        getDataFromDatabase(database);
        //عشان اخد البيانات واعرضه للناس
      }).catchError((error) {
        print('Error when Inserting Record ${error.toString()}');
      });
      return null;
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    //تصفير البينات عشان مايتحطو فوق بعض
    //add زي تنضيف على نضاف
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });

      emit(AppGetDatabaseState()); //يبدئ يتغير
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate(
        // Update some record
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value)
         {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deletData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) 
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  //هادي لما بدي اضغط عليه تضهر قائمة وعبي حاليا مغلق  يعني):
  IconData editIcon = Icons.edit;
  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) //عشان يضهرو وادخلهم اجباري
  {
    isBottomSheetShown = isShow;
    editIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}
