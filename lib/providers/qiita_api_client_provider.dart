import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_reader/apis/qiita/qiita_api_client.dart';
import 'package:qiita_reader/providers/dio_provider.dart';

final qiitaApiClientProvider = Provider<QiitaApiClient>((ref) {
  final dio = ref.watch(dioProvider);
  return QiitaApiClient(dio);
});
