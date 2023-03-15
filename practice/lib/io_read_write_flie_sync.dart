import 'dart:io';

void main() {
  //1. Create new file.
  File newFile = File('temp_file.txt');
  newFile.createSync();

  //2. Read file. (sync type)
  File poem = File('poem.txt');
  List<String> lines = poem.readAsLinesSync();
  for (String line in lines) {
    print(line);
  }

  //3. Write file. (sync type)
  File memoFile = File('diary.txt');
  String? contents = """
  2023.03.08 플러터 공부 중
  
  오늘은 플러터의 표준 라이브러리를 공부했다.
  안드로이드 스튜디오를 활용하여 예제를 실행 중이다.
  """;
  memoFile.writeAsStringSync(contents);
}