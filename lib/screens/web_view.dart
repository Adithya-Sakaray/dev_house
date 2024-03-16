import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
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
