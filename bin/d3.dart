class order {
  void turnOn() {}
  void set() {}
  void inc() {}
}

class Idle extends order {
  print();
}

class SetHours {}

class SetMins {}

void main(List<String> arguments) {
  List<String> input = ['on 18.0', 'set', 'inc', 'set', 'inc', 'inc', 'set'];

  List<order> state = [Idle(), SetHours(), SetMiins()];

  for (var input in input) {
    print(input);
  }

  //print(input);
}
