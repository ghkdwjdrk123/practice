import 'dart:io';

void main() {
  stdout.write('Enter name?? ');
  String? input = stdin.readLineSync();

  print('Hello, $input');
}