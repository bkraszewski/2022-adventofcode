import 'package:coding_calendar/input_reader.dart';

void day4partOne() async {
  final lines = await readLines('inputs/4_overlaps.txt');

  final score = lines.fold(0, (previousValue, element) {
    final data = element.split(',');
    final first = data[0].split('-').map((e) => int.parse(e));
    final firstAssignment = Assignment(first.first, first.last);

    final second = data[1].split('-').map((e) => int.parse(e));
    final secondAssignment = Assignment(second.first, second.last);

    //check if first is contained in another
    //awesome brute force solutions as World Cup game starts in a minute

    var hasMatch = true;
    for (var a = firstAssignment.start; a <= firstAssignment.end; a++) {
      if (a >= secondAssignment.start && a <= secondAssignment.end) {
        continue;
      } else {
        hasMatch = false;
        break;
      }
    }

    if (hasMatch) {
      return previousValue + 1;
    }

    hasMatch = true;
    for (var a = secondAssignment.start; a <= secondAssignment.end; a++) {
      if (a >= firstAssignment.start && a <= firstAssignment.end) {
        continue;
      } else {
        hasMatch = false;
        break;
      }
    }

    if (hasMatch) {
      return previousValue + 1;
    }

    return previousValue;
  });

  print('part one score: $score');
}

void day4partTwo() async {
  final lines = await readLines('inputs/4_overlaps.txt');

  final score = lines.fold(0, (previousValue, element) {
    final data = element.split(',');
    final first = data[0].split('-').map((e) => int.parse(e));
    final firstAssignment = Assignment(first.first, first.last);

    final second = data[1].split('-').map((e) => int.parse(e));
    final secondAssignment = Assignment(second.first, second.last);

    //check if first is contained in another
    //awesome brute force solutions as World Cup game starts in a minute

    for (var a = firstAssignment.start; a <= firstAssignment.end; a++) {
      if (a >= secondAssignment.start && a <= secondAssignment.end) {
        return previousValue + 1;
      } else {
        continue;
      }
    }

    for (var a = secondAssignment.start; a <= secondAssignment.end; a++) {
      if (a >= firstAssignment.start && a <= firstAssignment.end) {
        return previousValue + 1;
      } else {
        continue;
      }
    }

    return previousValue;
  });

  print('part two score: $score');
}

class Assignment {
  final int start;
  final int end;

  Assignment(this.start, this.end);
}
