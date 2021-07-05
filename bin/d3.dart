class order {
  void turnOn() {}
  void set() {}
  void inc() {}
}

class Idle extends order {
  int hours;
  int mins;
  Idle(this.hours, this.mins);

  @override
  void turnOn() {
    print("$hours:$mins in Idle state");
  }

  @override
  void set() {
    print("$hours:$mins");
  }
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
  const String text = 'on 18 0 set inc set inc inc set';
  var input = text.split(' ');

  int hours = 0;
  int mins = 0;
  String currentState = '';

  List<order> state = [Idle(hours, mins), SetHours(), SetMins()];

  for (var i = 0; i < input.length; i++) {
    if (input[i] == 'on') {
      //print(input[i]);
      hours = int.parse(input[i + 1]);
      mins = int.parse(input[i + 2]);
      if (hours == 0 && mins == 0) {
        state[0].turnOn;
        currentState = 'Idle';
      }
    } else {
      if (input[i] == 'set') {}
    }
  }

  //print(input);
}
