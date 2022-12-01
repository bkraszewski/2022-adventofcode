import 'dart:convert';
import 'dart:io';

Stream<String> readLines(String fileInputPath) {
  final file = File(fileInputPath);
  return file.openRead().transform(Utf8Decoder()).transform(LineSplitter());
}
