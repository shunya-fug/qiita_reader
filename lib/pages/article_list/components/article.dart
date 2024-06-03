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
    return Column(
      children: [
        Expanded(
          child: WebViewWidget(controller: controller),
        ),
        const _BottomBar(),
      ],
    );
  }
}

class _BottomBar extends ConsumerWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 戻るボタン
          _BottomBarItem(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // ブックマークボタン
          _BottomBarItem(
            icon: Icons.bookmark_border,
            onPressed: () {
              // TODO: ブックマーク追加
              logger.i('ブックマーク追加');
            },
          ),
          // 完了ボタン
          _BottomBarItem(
            icon: Icons.done,
            onPressed: () {
              // TODO: 完了
              logger.i('完了');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const _BottomBarItem({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(icon),
        style: IconButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
