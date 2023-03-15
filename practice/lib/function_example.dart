void main() {
  // 아래 2개는 됨.
  // 이게 기본문
  // String http1 = getHttp('https://naver.com', port: 80);
  // 순서를 변경해도 port는 이미 이름이 붙어있기 때문에 상관없음.
  // String http1 = getHttp(port: 80, 'https://naver.com');
  // 아래 2개는 안됨.
  // port: 는 반드시 붙어야 함.
  // String http1 = getHttp('https://naver.com', 80);
  // url을 붙여서는 안됨. 아마 gethttp를 선언할 때에만 쓸 수 있는 값으로 보임. 입력받은 argument를 바로 사용할 수 있도록 만든 느낌?
  // String http1 = getHttp(url: 'https://naver.com', port: 80);

  String http2 = getHttp('https://localhost');
  print(http1);
  print(http2);
}

String getHttp(String url, {int port = 8080}) => 'get https from $url, port = $port';