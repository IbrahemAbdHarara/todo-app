import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
late  final int result;
late final bool isMale;
late final int age;
BMIResultScreen({
  required this.age,
 required this.isMale,
 required this.result,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI RESULT (:')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender :${isMale?'Male':'Female'}',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            )
            ,Text(
              'Result :$result',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            )
           , Text(
              'Age :$age',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            )
         
          ],
        ),
      ),
    );
  }
}
