import 'dart:convert';
import 'dart:io';

Future<List<String>> readLines(String fileInputPath) {
  final file = File(fileInputPath);
  return file.readAsLines();
}
