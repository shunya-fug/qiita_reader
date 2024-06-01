// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_items_response.freezed.dart';
part 'get_items_response.g.dart';

/// 記事一覧取得レスポンス
@freezed
class GetItemsResponse with _$GetItemsResponse {
  const factory GetItemsResponse({
    required final String renderedBody,
    required final String body,
    required final int commentsCount,
    required final DateTime createdAt,
    required final String id,
    required final int likesCount,
    required final int stocksCount,
    required final List<_Tag> tags,
    required final String title,
    required final DateTime updatedAt,
    required final String url,
    required final _User user,
    final int? pageViewsCount,
    final String? organizationUrlName,
    required final bool slide,
  }) = _GetItemsResponse;

  factory GetItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetItemsResponseFromJson(json);
}

/// タグ
@freezed
class _Tag with _$Tag {
  const factory _Tag({
    required final String name,
    final List<String>? versions,
  }) = __Tag;

  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

/// ユーザー
@freezed
class _User with _$User {
  const factory _User({
    final String? description,
    final String? facebookId,
    final int? followeesCount,
    final int? followersCount,
    final String? githubLoginName,
    final String? id,
    final int? itemsCount,
    final String? linkedinId,
    final String? location,
    final String? name,
    final String? organization,
    final int? permanentId,
    final String? profileImageUrl,
    final bool? teamOnly,
    final String? twitterScreenName,
    final String? websiteUrl,
  }) = __User;

  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
