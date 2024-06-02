import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_reader/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 記事表示(WebView)
class Article extends ConsumerWidget {
  final String url;

  const Article(this.url, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) => logger.i('progress: $progress'),
        onPageStarted: (url) => logger.i('onPageStarted: $url'),
        onPageFinished: (url) => logger.i('onPageFinished: $url'),
        onWebResourceError: (error) => logger.e('onWebResourceError: $error'),
      ));
    return WebViewWidget(controller: controller);
  }
}
