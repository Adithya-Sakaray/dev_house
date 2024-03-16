import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final chatWebViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://deadsimplechat.com/gfgcOgwwN'));

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("SD"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaQueryData.size.height,
                width: mediaQueryData.size.width,
                child: WebViewWidget(controller: chatWebViewController),
              )
            ],
          ),
        ));
  }
}
