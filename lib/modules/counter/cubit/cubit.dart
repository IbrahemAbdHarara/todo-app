import 'package:first_app/modules/counter/cubit/statele.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit()
      : super(CounterInitialState()); //الاؤلي المبدئي State استدعيت ال
  //عشان يبدئ

  //to be more easily when use this cubit in many place
  static CounterCubit get(context) => BlocProvider.of(context);
//عشان يسهل عليا واجيب اوجكت منه مثلا الي تحت سهلة استدعيه
  int counter = 1;
  void minus() {
    counter--;
    emit(CounterMinaslState(
        counter)); //عشانهي لسا بتسمع ماغيرت اشي فحطيته عشان تغير
        //عشان اعرف اتحرك
  }

  void Plus() {
    counter++;
    emit(CounterPluslState(counter)); //عشان اغير القيمة والكل يشتغل
        //عشان اعرف اتحرك
  }
}
