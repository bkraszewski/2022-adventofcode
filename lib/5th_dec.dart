import 'package:coding_calendar/input_reader.dart';

void day5partOne() async {
  await _moveCrates((moved, crates, from, to) {
    for (int b = 0; b < moved.length; b++) {
      crates[to].insert(0, moved[b]);
    }
  });
}

Future<void> _moveCrates(
    Function(List moved, List crates, int from, int to) load) async {
  final lines = await readLines('inputs/5_crates.txt');

  var index = 0;

  final crates = List.generate(9, (index) => []);

  for (var a = 0; a < lines.length; a++) {
    final line = lines[a];

    if (lines[a + 1].replaceAll(' ', '').isEmpty) {
      break;
    }

    for (var b = 0; b < 9; b++) {
      final letter = line[b * 4 + 1];
      if (letter != ' ') {
        crates[b].add(letter);
      }
    }

    index++;
  }

  for (var a = index + 2; a < lines.length; a++) {
    final line = lines[a];
    final command = line.split(' ');
    final count = int.parse(command[1]);
    final from = int.parse(command[3]) - 1;
    final to = int.parse(command[5]) - 1;

    final moved = [];
    for (int b = 0; b < count; b++) {
      moved.add(crates[from].removeAt(0));
    }

    load(moved, crates, from, to);
  }

  final output = [];
  for (var element in crates) {
    output.add(element.first);
  }

  print(output.join(''));
}

void day5partTwo() async {
  await _moveCrates((moved, crates, from, to) {
    for (int b = moved.length - 1; b > -1; b--) {
      crates[to].insert(0, moved[b]);
    }
  });
}
