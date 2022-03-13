// ignore_for_file: unused_import

//import 'dart:ffi';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'dart:math';
// ignore: avoid_web_libraries_in_flutter

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/modules/archived_tasks/archived_tasks_screene.dart';
import 'package:first_app/modules/done_tasks/done_tasks_screene.dart';
import 'package:first_app/modules/new_tasks/new_tasks_screene.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/components/constans.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..createDatabase(), // var in AppCubit saves كااني
      child: BlocConsumer<AppCubit, AppStates>(
        listener: ((BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        }), //عشان يقفلها بعد
        builder: ((BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(
              context); //عند الاستدعاء cubit عشان يمشي عليه بس بكتب
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),

            body: ConditionalBuilder(
              condition: state
                  is! AppGetDatabaseLoadingState, //لماذا ترو: لتنفيذ السكرين الي تحت
              builder: (context) => cubit.screene[cubit
                  .currentIndex], //السكرين الي بدها تضهر عند يقع الاختيار عليه
              fallback: (context) => const Center(
                  child:
                      CircularProgressIndicator()), //بيتاع الي بلف انو يعني قاع بحمل
            ),
            //الي بلف
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                /* async {
              //اذا  يمكن يحصل خطاء وانا بشعارف ايش هو 
              try {
                //حاول تنفيذ هاد
                var name = await getName();
                //استني اشوي اهدي عبال ماتكتمل العملية (:
                print(name);
                print('harara (:');
                throw ('some error (: !!'); //make error (:
              } catch (error) {
                //اذا حصل error جيبو ايش هو
                print('error${error.toString()}');
              }
            },
          
              //harara(: هادي بش اضمن اني خلصت ال باك عشان اطبع
              getName().then((value) {
                print(value);
                print('harara (:');
                //  throw ('ooopess!! (- _ -)');
              }).catchError((Error) {
                print('error${Error.toString()}');
              });
          */
                //  insertDatabase();
                //الاغلاق
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                    //اول اشي بدخل البينات الي مدخله
                    // insertToDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    //   //عشان ياخد القيم الي اخترناه
                    // ).then((value) {
                    //   //بعدين اخده
                    //   getDataFromDatabase(database).then((value) {
                    //     //بعدين اقفل يمعلم
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //     //   //اعكس
                    //     //   isBottomSheetShown = false; //بعدين اقفل
                    //     //   editIcon = Icons.edit;
                    //     //   tasks = value; //اخدة القيمة ال list عشان تحفضه
                    //     //   print('good joob(- _ -)$tasks');
                    //     // });
                    //   });
                    //   //عشان اخد البيانات واعرضه للناس
                    //  });
                    //للاحتواء
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              color: Colors.grey[300],
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: titleController,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },

                                      //لاضهار والاخفاء
                                      decoration: const InputDecoration(
                                        labelText: 'Tasks Title',

                                        prefixIcon: Icon(Icons.title),
                                        border:
                                            OutlineInputBorder(), //بحوطه زي بوكس
                                      ),

                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return ' title must is empty';
                                        } //عشان يربطو لازم يعبي قبل ميطلع :)
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      controller: timeController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },
                                      onChanged: (String value) {
                                        print(value);
                                      },
                                      //لاضهار والاخفاء
                                      decoration: const InputDecoration(
                                        labelText: 'Tasks Time',
                                        prefixIcon: Icon(Icons.timelapse),
                                        border: OutlineInputBorder(),
                                      ),
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                          print(value.format(context));
                                        });
                                      },

                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return ' time must is empty';
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      controller: dateController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },
                                      onChanged: (String value) {
                                        print(value);
                                      },

                                      //لاضهار والاخفاء
                                      decoration: const InputDecoration(
                                        labelText: 'Tasks Date',
                                        prefixIcon: Icon(Icons.date_range),
                                        border: OutlineInputBorder(),
                                      ),
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2022-17-03'),
                                        ).then((value) {
                                          dateController.text =
                                              DateFormat.yMMMEd()
                                                  .format(value!);
                                          print(DateFormat.yMMMEd()
                                              .format(value));
                                          // بخلي التاريخ يضهر الي اخترته ويكتبه في الفراغه
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return ' date must is empty';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit); //(classs cubit)  استدعيته من غاد
                  });
                  cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add); //(classs cubit)  استدعيته من غاد
                }
              },
              child: Icon(cubit.editIcon), //editIcon بسمع ال
            ),

            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit
                    .currentIndex, //بمشي  على العناصر وبقدر اضغط عليهم واتنقل بينهم
                onTap: (index) {
                  // setState(() {
                  // });
                  cubit.changeIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.new_label,
                      color: Colors.blue,
                      size: 30,
                    ),
                    label: 'new',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done, color: Colors.green, size: 30),
                      label: 'done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive, color: Colors.red, size: 30),
                      label: 'Archived'),
                ]),
          );
        }),
      ),
    );
  }

  /* Future<String> getName() async {
//async خليتها  background عشان شغال في ال
//عشان هيتنفذ انشا الله  بس امتى بشعارف
//async: ينتضر ويعلق تنفيذ المهم  لعند اكتمال المهم

    //Instance of '_Future<String>'
    return 'heama abd harara (:';
  }
*/
/*
  void createDatabase() async {
    database = await openDatabase(
      'todo.db', //db اسم ال
      version: 1, //لسا بدي انشاء عشان
      onCreate: (database, version) {
        print('database created ');
        database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,status TEXT)')
            .then((value) {
          print('table created ');
        }).catchError((onError) {
          print('error when created table${onError.toString()}');
        });
      },

      onOpen: (database) {
        print('database onOpen ');
      },
    );
  }

  void insertDatabase() {

    database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,status)VALUES("first tasks","20","new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((onError) {
        print('error when inserted new Recode${onError.toString()}');
      });
    });
  }
*/

}
