void main() {
  Map<int, String> intMap = {
    0: 'AAA',
    50: 'BBB',
    100 : 'CCC'
  };

  print('intMap is $intMap');
  print('intMap[50] : ${intMap[50]}');
  intMap.update(50, (value) => 'DDD');
  print('Updated intMap is $intMap');
}