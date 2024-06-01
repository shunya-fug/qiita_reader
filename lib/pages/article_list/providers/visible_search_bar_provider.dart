import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 検索バーの表示・非表示を制御するプロバイダー
final visibleSearchBarProvider = StateProvider.autoDispose<bool>((ref) => true);
