import 'package:coding_calendar/input_reader.dart';

void day3PartOne() async {
  final lines = await readLines('inputs/3_rucksacks.txt');

  final total = lines.fold(0, (prev, element) {
    final half = (element.length / 2).floor();

    final first = element.substring(0, half);
    final second = element.substring(half, element.length);

    final repeating = <int>{};

    //find repeating element:
    first.split('').forEach((character) {
      if (second.contains(character)) {
        repeating.add(_getPriority(character));
      }
    });

    return prev + repeating.fold(0, (a, b) => a + b);
  });

  print('total part one: $total');
}

int _getPriority(String character) {
  //a - 97  -> 1
  //z - 122 -> 26

  //A -65 -> 27
  //Z - 90 -> 52
  final value = character.toLowerCase().codeUnitAt(0) - 96;
  return value + (character.codeUnitAt(0) < 97 ? 26 : 0);
}

void day3PartTwo() async {
  final lines = await readLines('inputs/3_rucksacks.txt');

  final allLetters =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz'.split('');

  var total = 0;

  for (var a = 0; a < lines.length; a += 3) {
    final arrays = [lines[a], lines[a + 1], lines[a + 2]];

    for (final letter in allLetters) {
      final count = arrays.where((element) => element.contains(letter)).length;

      if (count == 3) {
        total += _getPriority(letter);
      }
    }
  }

  print('part 2 total: $total');
}
