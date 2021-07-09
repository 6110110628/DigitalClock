const inputs = [
  '0 0',
  'inc',
  'set',
  'inc',
  'inc',
  'inc',
  'set',
  'inc',
  'set',
];

void main(List<String> arguments) {
  var ctx = Context(IdleState());
  var items = inputs[0].split(' ');
  var clock = Clock(ctx, int.parse(items[0]), int.parse(items[1]));

  for (var i = 0; i < inputs.length; i++) {
    switch (inputs[i]) {
      case 'inc':
        clock.doInc();
        break;
      case 'set':
        clock.doSet();
    }
  }
  print(clock);
  print('State = ${ctx.current.getName()}');
}

class Clock {
  final Context ctx;
  int hour;
  int min;

  Clock(this.ctx, this.hour, this.min) {
    ctx.clock = this;
  }

  void doSet() {
    ctx.goNext();
  }

  void doInc() {
    ctx.current.doInc(ctx);
  }

  @override
  String toString() {
    return '$hour: $min';
  }
}

class Context {
  State current;
  Clock? clock;

  Context(this.current);

  void goNext() {
    current.goNext(this);
  }

  void setState(State next) {
    current = next;
  }
}

abstract class State {
  void goNext(Context ctx);
  void doInc(Context ctx);
  String getName();
}

class IdleState implements State {
  @override
  void goNext(Context ctx) {
    ctx.setState(SettingHourState());
  }

  @override
  void doInc(Context ctx) {
    // do nothing
  }

  @override
  String getName() {
    return 'idle';
  }
}

class SettingHourState implements State {
  @override
  void goNext(Context ctx) {
    ctx.setState(SettingMinState());
  }

  @override
  void doInc(Context ctx) {
    ctx.clock!.hour = (ctx.clock!.hour + 1) % 24;
  }

  @override
  String getName() {
    return 'SettingHour';
  }
}

class SettingMinState implements State {
  @override
  void goNext(Context ctx) {
    ctx.setState(IdleState());
  }

  @override
  void doInc(Context ctx) {
    ctx.clock!.min = (ctx.clock!.min + 1) % 60;
  }

  @override
  String getName() {
    return 'SettingMin';
  }
}
