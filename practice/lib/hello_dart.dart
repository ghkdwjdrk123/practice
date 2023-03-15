void main() {
  int num1 = 100;
  double num2 = 3.14;
  num num3 = 100;
  num num4 = 3.14;

  double sum1 = num1 + num2;
  // Error: A value of type 'double' can't be assigned to a variable of type 'int'. 발생
  // int sum2 = num1 + num2;
  num sum2 = num1 + num2;

  print(sum1);
  print(sum2);

  num sum3 = num3 * num4;
  print(sum3);

  String text = 'Carpe diem, quam minimum credula postero';
  String myName = 'jeongtae';
  String hello = 'Hello, ${myName}';
  print(text.substring(0, 10));
  print(hello);
}


