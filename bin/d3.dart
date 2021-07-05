class order {
  void turnOn() {}
  void set() {}
  void inc() {}
}

class Idle extends order {
  @override
  void turnOn() {}

  @override
  void set() {}
}

class SetHours extends order {
  @override
  void turnOn() {}

  @override
  void set() {}

  @override
  void inc() {}
}

class SetMins extends order {
  @override
  void set() {}

  @override
  void inc() {}
}

void main(List<String> arguments) {
  List<dynamic> input = ['on 18.0', 'set', 'inc', 'set', 'inc', 'inc', 'set'];

  List<order> state = [Idle(), SetHours(), SetMins()];

  int hours = 0;
  int mins = 0;

  for (var input in input) {}

  //print(input);
}
