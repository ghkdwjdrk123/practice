void main() {
  List<int> evens = [2, 4, 6, 8, 10];

  print('evens are $evens');
  print('evens[0] is ${evens[0]}');
  // dart의 range에서 -1은 지원하지 않는다.
  // print('evens[-1] are ${evens[-1]}');
  print('evens[evens.length] is ${evens[evens.length-1]}');

  List<int> evenFromZero = [0, ...evens];
  print('evenFromZero is $evenFromZero');

  List<int> allEvens = evens + evenFromZero;

  // allEvens.sort()와 동일. (오름차순)
  // allEvens.sort((int a, int b) => a>=b?1:-1);

  // allEvens.sort()의 반대와 동일. (내림차순)
  // allEvens.sort((int a, int b) => a<=b?1:-1);

  // allEvens.sort();

  print('allEvens are $allEvens');
}