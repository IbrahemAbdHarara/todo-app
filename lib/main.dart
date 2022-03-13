//import 'package:first_app/betakati_app.dart';
// ignore_for_file: unused_label

//import 'dart:developer';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_app/layout/home_layout.dart';
//import 'package:first_app/flutter_challenge/movies_page.dart';
//import 'package:first_app/layout/home_layout.dart';
//import 'package:first_app/modules/bmi_result/bmi__result_screen.dart';
//import 'package:first_app/modules/bmi/bmi_screen.dart';
import 'package:first_app/modules/counter/counter_Screen.dart';
import 'package:first_app/modules/counter/cubit/statele.dart';
import 'package:first_app/modules/login/login_screen.dart';
import 'package:first_app/modules/messenger/Messenger_secreen.dart';
import 'package:first_app/shared/bloc_observer.dart';
//import 'package:first_app/counter_Screen.dart';
//import 'package:first_app/home_secrean.dart';
//import 'package:first_app/login_screen.dart';
//import 'package:first_app/user_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';

void main() {
  //BLoC Observer لتشغيل ال
  FlutterServicesBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp()); // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove tape red top
      home: HomeLayout(),
    );
  }
}
