import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/modules/counter/counter_Screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/components/constans.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        var tasks = AppCubit.get(context).newTasks;

        return tasksBuilder(tasks: tasks);
         //حطنها عشان يضهر سكرين اذا مافيه بيانات
      }),
    );
  }
}
