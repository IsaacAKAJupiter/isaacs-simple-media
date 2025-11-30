// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CategoryDto extends CategoryDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final JsonObject? description;
  @override
  final MediaItemDto? thumbnail;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final BuiltList<CategoryTagDto>? tags;
  @override
  final BuiltList<MediaItemDto>? mediaItems;

  factory _$CategoryDto([void Function(CategoryDtoBuilder)? updates]) =>
      (CategoryDtoBuilder()..update(updates))._build();

  _$CategoryDto._(
      {required this.id,
      required this.name,
      this.description,
      this.thumbnail,
      required this.createdAt,
      required this.updatedAt,
      this.tags,
      this.mediaItems})
      : super._();
  @override
  CategoryDto rebuild(void Function(CategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryDtoBuilder toBuilder() => CategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryDto &&
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
    return (newBuiltValueToStringHelper(r'CategoryDto')
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

class CategoryDtoBuilder implements Builder<CategoryDto, CategoryDtoBuilder> {
  _$CategoryDto? _$v;

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

  CategoryDtoBuilder() {
    CategoryDto._defaults(this);
  }

  CategoryDtoBuilder get _$this {
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
  void replace(CategoryDto other) {
    _$v = other as _$CategoryDto;
  }

  @override
  void update(void Function(CategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryDto build() => _build();

  _$CategoryDto _build() {
    _$CategoryDto _$result;
    try {
      _$result = _$v ??
          _$CategoryDto._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'CategoryDto', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CategoryDto', 'name'),
            description: description,
            thumbnail: _thumbnail?.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'CategoryDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CategoryDto', 'updatedAt'),
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
            r'CategoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
