import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_items_request.freezed.dart';
part 'get_items_request.g.dart';

/// 記事一覧取得リクエスト
@freezed
class GetItemsRequest with _$GetItemsRequest {
  @Assert('1 <= page && page <= 100')
  @Assert('1 <= perPage && perPage <= 100')
  const factory GetItemsRequest({
    /// ページ番号[1-100]
    @Default(1) final int page,

    /// 1ページあたりの取得件数[1-100]
    @Default(20) final int perPage,

    /// 検索クエリ
    @Default(null) final String? query,
  }) = _GetItemsRequest;

  factory GetItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetItemsRequestFromJson(json);
}
