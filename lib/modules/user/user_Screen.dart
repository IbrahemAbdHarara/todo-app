import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> user = [
    UserModel(id: 1, name: 'ibrahim', phone: '723623824'),
    UserModel(id: 2, name: 'محمد', phone: '2525252352'),
    UserModel(id: 3, name: 'انشتاين', phone: '348719212'),
    UserModel(id: 4, name: 'dad', phone: '238431410184'),
    UserModel(id: 1, name: 'ibrahim', phone: '723623824'),
    UserModel(id: 2, name: 'محمد', phone: '2525252352'),
    UserModel(id: 3, name: 'انشتاين', phone: '348719212'),
    UserModel(id: 4, name: 'dad', phone: '238431410184')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi (:'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(user[index]),
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.grey[400],
              ),
          itemCount: user.length),
    );
  }

  //1. build item
  //2. bukid llist
  //3. add item to list
  Widget buildUserItem(UserModel  user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.blue,
              child: Text(
                '${user.id}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                 ' ${user.name}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      );
}
