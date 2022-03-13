import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity, //قيمة مبدئي ابتتغير بعدين
  Color bakground = Colors.blue,
  required Function function, //قيمة مبدئي ابتتغير بعدين
  bool isUpperCase = true,
  required String text,
  double Radius = 0.0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Radius), color: bakground),
    );
/*
Widget defaultFromField({
  required TextEditingController controller,
  required TextInputType type,
   Function? onSubmit,
  Function? onGhang,//عشان اختياري هيكوهيك مفتوح
  required Function validate,

  
  required String label,
  required IconData prefix,
})=>
 TextFormField(
                    controller: controller,
                    keyboardType: type,
                 //   obscureText: true,
                    onFieldSubmitted: onSubmit!(),
                    onChanged:onGhang!(),
                    validator: validate(),
                     decoration:  InputDecoration(
                      labelText: label,
                      prefixIcon: Icon(prefix),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                    ),
                  );
                
*/

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  suffixPressed,
  bool isClickable = true,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    enabled: isClickable,
    onFieldSubmitted: onSubmit!(),
    onChanged: onChange!(),
    onTap: onTap!(),
    validator: validate(),
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
              ),
            )
          : null,
      border: OutlineInputBorder(),
    ),
  );
}

Widget buildTaskItem(Map model, context) => Dismissible(
  key:Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 50.0,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, //تاخد مساحة اقل

                children: [
                  Text(
                    '${model['title']}',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('${model['date']}', style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'done', id: model['id']);
              },
              icon: Icon(Icons.check_box),
              color: Colors.amber,
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
              onPressed: () {
                 AppCubit.get(context)
                    .updateData(status: 'archive', id: model['id']);
              },
              icon: Icon(Icons.archive),
              color: Colors.indigo,
            ),
          ],
        ),
      ),
   onDismissed: (direcrion){
     AppCubit.get(context).deletData(id: model['id'],);
     //لحذف العناصر بس عليا اسحب على اليمين بتحذ
   },
    );

Widget tasksBuilder(
 { required List<Map>tasks,}
)=>  
  ConditionalBuilder(
          condition: tasks.length > 0,
          builder: ((context) => ListView.separated(
              itemBuilder: (context, index) =>
                  buildTaskItem(tasks[index], context),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
              itemCount: tasks.length)),

          fallback: ((context) => Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.menu,
                        size: 150,
                        color: Colors.amber,
                      ),
                      Text(
                        'No Tasks Yet, Please Add Some Tasks ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                      )
                    ]),
              )), //هادي السكرين
        );
    