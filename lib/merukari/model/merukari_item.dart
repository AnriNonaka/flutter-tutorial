import 'package:freezed_annotation/freezed_annotation.dart';

part 'merukari_item.freezed.dart';

part 'merukari_item.g.dart';

@freezed
class MerukariItem with _$MerukariItem {
  const factory MerukariItem({
    @JsonKey(name: 'imagePath') String? imagePath,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'compassion') String? compassion,
  }) = _MerukariItem;

  factory MerukariItem.fromJson(Map<String, dynamic> json) =>
      _$MerukariItemFromJson(json);
}
