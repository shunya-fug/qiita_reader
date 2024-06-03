import 'package:qiita_reader/apis/qiita/requests/get_items_request.dart';
import 'package:qiita_reader/apis/qiita/responses/get_items_response.dart';
import 'package:qiita_reader/providers/qiita_api_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_items_provider.g.dart';

/// 記事一覧取得コントローラー
/// [GetItemsRequestController]が更新されるタイミングで記事一覧を取得する
@riverpod
Future<List<GetItemsResponse>> getItemsController(
    GetItemsControllerRef ref) async {
  final qiita = ref.read(qiitaApiClientProvider);
  final request = ref.watch(getItemsRequestControllerProvider);
  final articleList = await qiita.getItems(request);
  return articleList;
}

/// 記事一覧取得リクエストコントローラー
@riverpod
class GetItemsRequestController extends _$GetItemsRequestController {
  @override
  GetItemsRequest build() {
    return const GetItemsRequest();
  }

  void update(GetItemsRequest request) {
    state = request.copyWith(
      page: request.page.clamp(1, 100),
      perPage: request.perPage.clamp(1, 100),
      query: request.query != null && request.query!.isEmpty
          ? null
          : request.query,
    );
  }
}
