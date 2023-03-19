import 'package:flutter/material.dart';

void main() => runApp(TextDemo());

class TextDemo extends StatelessWidget {
  static const String _title = "Text 위젯 데모 실사판";
  static const String _name = 'Unpoor';
  static const String _longText = """
  플러터(Flutter)는 어쩌구 저쩌구.
  로버트 기요사키 - 부자들의 음모
  유동환 - 처음 배우는 플러터 -> 내일까지 반납해야함. 반납하고 다시 빌려올 수 있나?
  """;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("단순 텍스트 표시"), //simple text
            Text(
              'Styled Text with $_name', //styled text
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.0, //dp
                background: Paint()
                  ..color = Color(0xFFDCEDC8)
                  ..style = PaintingStyle.fill,
                fontWeight: FontWeight.bold),
            ),
            Text(
              _longText,
              overflow: TextOverflow.ellipsis, //text overfolw 공간을 넘었을 떄 말줄임으로 줄여줌.
            ),
            // Image.asset('assets/image/1234.png'),
            Image.asset('assets/image/스크린샷 2023-03-19 오후 5.01.22.png'),
          ],
        ),
      )
    );
  }
}