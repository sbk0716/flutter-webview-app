import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_app/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Widget for WebPage
class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  // Controller that manages the WebView.
  late WebViewController controller;
  // progress for LinearProgressIndicator
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebPage'),
        actions: [
          IconButton(
            onPressed: () async {
              // Check whether there's a back history item.
              if (await controller.canGoBack()) {
                // Go back in the history of this WebView.
                controller.goBack();
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              // Reload the current URL.
              controller.reload();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.red,
            backgroundColor: Colors.grey,
          ),
          Expanded(
            child: Consumer(
              builder: ((context, ref, child) {
                final _provider = ref.watch(provider.notifier);
                return WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: _provider.state,
                  onWebViewCreated: (controller) {
                    // Manage this WebView
                    this.controller = controller;
                  },
                  onProgress: (progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
