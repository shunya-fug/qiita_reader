import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_reader/apis/qiita/providers/get_items_provider.dart';
import 'package:qiita_reader/main.dart';
import 'package:qiita_reader/pages/article_list/providers/scroll_controller_provider.dart';

/// 記事一覧
class ArticleList extends ConsumerWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(getItemsControllerProvider);
    return response.when(
      error: (error, _) {
        return Text('エラー: ${error.toString()}');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      data: (articleList) {
        return ListView.builder(
          controller: ref.watch(scrollControllerProvider),
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(articleList[index].title),
              onTap: () {
                // TODO:ここに記事詳細画面への遷移処理を書く
                logger.i('記事詳細画面へ遷移: ${articleList[index].url}');
              },
            );
          },
        );
      },
    );
  }
}
