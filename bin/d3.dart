class Idle {}

class SetHours {}

class SetMins {}

void main(List<String> arguments) {
  List<String> input = ['on 18.0', 'set', 'inc', 'set', 'inc', 'inc', 'set'];
  var hour = 0;
  var min = 0;
  var state = 0;

  for (var input in input) {
    print(input);
  }

  //print(input);
}
