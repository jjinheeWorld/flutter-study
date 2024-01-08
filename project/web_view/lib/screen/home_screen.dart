import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://github.com/jjinheeWorld');

class HomeScreen extends StatelessWidget {
  /// final result = WebViewController().loadRequest();
  ///
  /// final controller = WebViewController();
  /// final result = controller.loadRequest();
  ///
  /// ..은 함수가 실행된 대상이 반환 + 함수 실행도 된 것
  /// final result2 = WebViewController..loadRequest();
  ///
  /// final result2 = WebViewController();
  /// result2.loadRequest();
  WebViewController controller = WebViewController()..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('jjinheeWorld'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.loadRequest(homeUrl);
            },
            icon: Icon(
              Icons.home
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}