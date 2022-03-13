import 'package:first_app/modules/counter/cubit/cubit.dart';
import 'package:first_app/modules/counter/cubit/statele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//state less contain one class provide widget
//state ful contain 2 classes
//1. first class provide widget
//2. second class provide state from this widget

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Bloc استدعائ اوبجكت من ال
    return BlocProvider(

        //Bloc هو الي بشغل ال
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: ((BuildContext context, CounterStates state) {
            if (state is CounterMinaslState) {
              //  print('Minas State ${CounterCubit.get(context).counter}');
            }
            if (state is CounterPluslState) {
              //print('Plus State ${state.counter}');
            }
            //عشان اعرف انا وين اثناء التنقل:)
          }),
          //listener بناء على ال  builder بي
          builder: ((BuildContext context, CounterStates state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(" عداد يامعلم (: ",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        //build  وضيفته بي  تري بيلد ال
                        CounterCubit.get(context).minus();
                      },
                      child: Text(
                        'MINUS',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '${CounterCubit.get(context).counter}', //يعني اسهل
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        CounterCubit.get(context).Plus();
                      },
                      child: Text('ADD',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
