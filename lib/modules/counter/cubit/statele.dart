abstract class CounterStates {}

//extends منه اكتر من حاجه
class CounterInitialState extends CounterStates {}

class CounterChangelState extends CounterStates {}

class CounterPluslState extends CounterStates {
  //Statele عشان ابعت قيمته مع
  late final int counter;
  CounterPluslState(this.counter); //ui عشان ابعت قيمة مع
}

class CounterMinaslState extends CounterStates {
  //Statele عشان ابعت قيمته مع
  late final int counter;
  CounterMinaslState(this.counter);
}
