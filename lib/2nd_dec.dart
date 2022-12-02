import 'package:coding_calendar/input_reader.dart';

void day2PartOne() async {
  final lines = await readLines('inputs/2_rock_paper.txt');

  final result = lines.fold(0, (previousValue, element) {
    final opponentChoice = element[0];
    final myChoice = element[2];

    return previousValue +
        _pointsByMyChoice(myChoice) +
        _fightResult(opponentChoice, myChoice);
  });

  print('part one: $result');
}

void day2PartTwo() async {
  final lines = await readLines('inputs/2_rock_paper.txt');

  //X have to loose
  //Y have to draw
  //Z have to win

  final result = lines.fold(0, (previousValue, element) {
    final opponentChoice = element[0];
    final expectedResult = element[2];

    final myChoice =
        _choiceByOpponendAndExpectedResult(opponentChoice, expectedResult);

    return previousValue +
        _pointsByMyChoice(myChoice) +
        (expectedResult == 'X'
            ? 0
            : expectedResult == 'Y'
                ? 3
                : 6);
  });

  print('Part two: $result');
}

_choiceByOpponendAndExpectedResult(
        String opponentChoice, String expectedResult) =>
    (_partTwoMapping[opponentChoice] ?? {})[expectedResult] ?? 0;

int _fightResult(String opponentChoice, String myChoice) {
  return (_partOneMapping[opponentChoice] ?? {})[myChoice] ?? -1;
}

//oponent choices:
//A rock, B paper, C scissors

//Expected actions:
//X loose Y draw Z win

//my choices:
//X rock Y paper Z scissors

const _partTwoMapping = {
  'A': {
    'X': 'Z',
    'Y': 'X',
    'Z': 'Y',
  },
  'B': {
    'X': 'X',
    'Y': 'Y',
    'Z': 'Z',
  },
  'C': {
    'X': 'Y',
    'Y': 'Z',
    'Z': 'X',
  }
};

const _partOneMapping = {
  'A': {
    'X': 3,
    'Y': 6,
    'Z': 0,
  },
  'B': {
    'X': 0,
    'Y': 3,
    'Z': 6,
  },
  'C': {
    'X': 6,
    'Y': 0,
    'Z': 3,
  }
};

//rocks:
//A, X

//papers:
//B, Y

//scissors
//C, Z

int _pointsByMyChoice(String myChoice) {
  switch (myChoice) {
    case 'X':
      return 1;
    case 'Y':
      return 2;
    case 'Z':
      return 3;
  }

  return 0;
}
