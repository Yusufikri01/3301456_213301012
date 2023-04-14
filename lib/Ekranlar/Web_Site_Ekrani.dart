import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web_Site_Ekrani extends StatefulWidget {
  const Web_Site_Ekrani({Key? key}) : super(key: key);

  @override
  State<Web_Site_Ekrani> createState() => _Web_Site_EkraniState();
}

class _Web_Site_EkraniState extends State<Web_Site_Ekrani> {
  @override
  late final WebViewController controller;
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://tyt-puan.hesaplama.net/"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NET HESAPLA"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebViewWidget(
            controller: controller,
          ),
        ));
  }
}
