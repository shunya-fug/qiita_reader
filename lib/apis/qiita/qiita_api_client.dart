import 'package:dio/dio.dart';
import 'package:qiita_reader/apis/qiita/requests/get_items_request.dart';
import 'package:qiita_reader/apis/qiita/responses/get_items_response.dart';
import 'package:qiita_reader/constants/urls.dart';
import 'package:retrofit/http.dart';

part 'qiita_api_client.g.dart';

@RestApi(baseUrl: qiitaApiV2)
abstract class QiitaApiClient {
  factory QiitaApiClient(Dio dio, {String baseUrl}) = _QiitaApiClient;

  /// 記事一覧取得
  /// https://qiita.com/api/v2/docs#get-apiv2authenticated_useritems
  @GET('/items')
  Future<List<GetItemsResponse>> getItems(@Queries() GetItemsRequest request);
}
