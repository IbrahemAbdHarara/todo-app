import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ArchivedTasksScreene extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   // return Center(child: Text('Archived task',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),));
       
return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
 var tasks = AppCubit.get(context).archivedTasks;
        return tasksBuilder(tasks: tasks);
         //حطنها عشان يضهر سكرين اذا مافيه بيانات
      }),
    );
  /*
  BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {

        return ListView.separated(
            itemBuilder: (context, index) =>
                buildTaskItem(tasks[index], context),
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],
                ),
            itemCount: tasks.length);
      }),
    );
 */
  }
}