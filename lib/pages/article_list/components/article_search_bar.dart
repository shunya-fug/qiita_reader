import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_reader/apis/qiita/providers/get_items_provider.dart';
import 'package:qiita_reader/apis/qiita/requests/get_items_request.dart';
import 'package:qiita_reader/main.dart';
import 'package:qiita_reader/pages/article_list/providers/visible_search_bar_provider.dart';

/// 検索バー
class ArticleSearchBar extends HookConsumerWidget {
  const ArticleSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset =
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);
    final isVisible = offset.bottom > 0 || ref.watch(visibleSearchBarProvider);
    return Padding(
      padding: offset,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: isVisible ? 80 : 0,
        child: BottomAppBar(
          elevation: 1,
          child: isVisible
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: '検索',
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: useTextEditingController(),
                  onSubmitted: (text) {
                    logger.i('記事一覧検索: $text');
                    ref.read(getItemsRequestControllerProvider.notifier).update(
                          GetItemsRequest(
                            query: text,
                          ),
                        );
                  },
                )
              : null,
        ),
      ),
    );
  }
}
