import 'dart:io';

main() async {
  HttpServer requestServer =
      await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
//      await HttpServer.bind('192.168.0.20', 8080);
  print('http服务启动起来了.');

  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    switch (request.method) {
      case 'GET':
        handleGet(request);
        break;
      case 'POST':
        handlePost(request);
        break;
    }
  } catch (e) {
    print('捕获了一个异常: $e');
  }
}

void handleGet(HttpRequest request) {
  request.response
    ..write('get request success...3')
    ..close();
}

void handlePost(HttpRequest request) {
  // todo: 处理POST请求
}
