import 'package:flutter/material.dart';
import 'package:qiita_reader/pages/article_list/components/article_list.dart';
import 'package:qiita_reader/pages/article_list/components/article_search_bar.dart';

/// 記事一覧画面
class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ArticleList(),
      ),
      bottomNavigationBar: ArticleSearchBar(),
    );
  }
}
