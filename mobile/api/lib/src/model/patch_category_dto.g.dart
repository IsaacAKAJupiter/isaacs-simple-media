// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PatchCategoryDto extends PatchCategoryDto {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final JsonObject? description;
  @override
  final MediaItemDto? thumbnail;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<CategoryTagDto>? tags;
  @override
  final BuiltList<MediaItemDto>? mediaItems;

  factory _$PatchCategoryDto(
          [void Function(PatchCategoryDtoBuilder)? updates]) =>
      (PatchCategoryDtoBuilder()..update(updates))._build();

  _$PatchCategoryDto._(
      {this.id,
      this.name,
      this.description,
      this.thumbnail,
      this.createdAt,
      this.updatedAt,
      this.tags,
      this.mediaItems})
      : super._();
  @override
  PatchCategoryDto rebuild(void Function(PatchCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatchCategoryDtoBuilder toBuilder() =>
      PatchCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatchCategoryDto &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        thumbnail == other.thumbnail &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        tags == other.tags &&
        mediaItems == other.mediaItems;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumbnail.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, mediaItems.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatchCategoryDto')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('thumbnail', thumbnail)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('tags', tags)
          ..add('mediaItems', mediaItems))
        .toString();
  }
}

class PatchCategoryDtoBuilder
    implements Builder<PatchCategoryDto, PatchCategoryDtoBuilder> {
  _$PatchCategoryDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  JsonObject? _description;
  JsonObject? get description => _$this._description;
  set description(JsonObject? description) => _$this._description = description;

  MediaItemDtoBuilder? _thumbnail;
  MediaItemDtoBuilder get thumbnail =>
      _$this._thumbnail ??= MediaItemDtoBuilder();
  set thumbnail(MediaItemDtoBuilder? thumbnail) =>
      _$this._thumbnail = thumbnail;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<CategoryTagDto>? _tags;
  ListBuilder<CategoryTagDto> get tags =>
      _$this._tags ??= ListBuilder<CategoryTagDto>();
  set tags(ListBuilder<CategoryTagDto>? tags) => _$this._tags = tags;

  ListBuilder<MediaItemDto>? _mediaItems;
  ListBuilder<MediaItemDto> get mediaItems =>
      _$this._mediaItems ??= ListBuilder<MediaItemDto>();
  set mediaItems(ListBuilder<MediaItemDto>? mediaItems) =>
      _$this._mediaItems = mediaItems;

  PatchCategoryDtoBuilder() {
    PatchCategoryDto._defaults(this);
  }

  PatchCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _thumbnail = $v.thumbnail?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _tags = $v.tags?.toBuilder();
      _mediaItems = $v.mediaItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatchCategoryDto other) {
    _$v = other as _$PatchCategoryDto;
  }

  @override
  void update(void Function(PatchCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatchCategoryDto build() => _build();

  _$PatchCategoryDto _build() {
    _$PatchCategoryDto _$result;
    try {
      _$result = _$v ??
          _$PatchCategoryDto._(
            id: id,
            name: name,
            description: description,
            thumbnail: _thumbnail?.build(),
            createdAt: createdAt,
            updatedAt: updatedAt,
            tags: _tags?.build(),
            mediaItems: _mediaItems?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnail';
        _thumbnail?.build();

        _$failedField = 'tags';
        _tags?.build();
        _$failedField = 'mediaItems';
        _mediaItems?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PatchCategoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
