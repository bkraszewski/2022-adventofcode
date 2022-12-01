import 'dart:math';

import 'package:collection/collection.dart';

import 'input_reader.dart';

void day1PartOne() async {
  final lines = await readLines('./inputs/1_calories.txt');

  var maximum = 0;
  var current = 0;

  for (final line in lines) {
    if (line == '') {
      if (current > maximum) {
        maximum = current;
      }

      current = 0;
      continue;
    }

    final val = int.tryParse(line);

    if (val != null) {
      current += val;
      continue;
    }
  }

  maximum = max(maximum, current);

  print('Top elve is carrying $maximum calories');
}

void day1PartTwo() async {
  final lines = await readLines('./inputs/1_calories.txt');

  var current = 0;
  final queue = PriorityQueue<int>((p1, p2) => p2.compareTo(p1));

  for (final line in lines) {
    if (line == '') {
      queue.add(current);

      current = 0;
      continue;
    }

    final val = int.tryParse(line);

    if (val != null) {
      current += val;
      continue;
    }
  }

  var maximum = 0;

  for (var a = 0; a < 3; a++) {
    if (queue.isNotEmpty) {
      maximum += queue.removeFirst();
    }
  }

  print('Top 3 elves carry $maximum calories');
}
