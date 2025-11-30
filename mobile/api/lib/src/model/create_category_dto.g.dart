// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCategoryDto extends CreateCategoryDto {
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? thumbnailMediaID;
  @override
  final BuiltList<num>? tags;

  factory _$CreateCategoryDto(
          [void Function(CreateCategoryDtoBuilder)? updates]) =>
      (CreateCategoryDtoBuilder()..update(updates))._build();

  _$CreateCategoryDto._(
      {required this.name, this.description, this.thumbnailMediaID, this.tags})
      : super._();
  @override
  CreateCategoryDto rebuild(void Function(CreateCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCategoryDtoBuilder toBuilder() =>
      CreateCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCategoryDto &&
        name == other.name &&
        description == other.description &&
        thumbnailMediaID == other.thumbnailMediaID &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumbnailMediaID.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCategoryDto')
          ..add('name', name)
          ..add('description', description)
          ..add('thumbnailMediaID', thumbnailMediaID)
          ..add('tags', tags))
        .toString();
  }
}

class CreateCategoryDtoBuilder
    implements Builder<CreateCategoryDto, CreateCategoryDtoBuilder> {
  _$CreateCategoryDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _thumbnailMediaID;
  String? get thumbnailMediaID => _$this._thumbnailMediaID;
  set thumbnailMediaID(String? thumbnailMediaID) =>
      _$this._thumbnailMediaID = thumbnailMediaID;

  ListBuilder<num>? _tags;
  ListBuilder<num> get tags => _$this._tags ??= ListBuilder<num>();
  set tags(ListBuilder<num>? tags) => _$this._tags = tags;

  CreateCategoryDtoBuilder() {
    CreateCategoryDto._defaults(this);
  }

  CreateCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _thumbnailMediaID = $v.thumbnailMediaID;
      _tags = $v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCategoryDto other) {
    _$v = other as _$CreateCategoryDto;
  }

  @override
  void update(void Function(CreateCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCategoryDto build() => _build();

  _$CreateCategoryDto _build() {
    _$CreateCategoryDto _$result;
    try {
      _$result = _$v ??
          _$CreateCategoryDto._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateCategoryDto', 'name'),
            description: description,
            thumbnailMediaID: thumbnailMediaID,
            tags: _tags?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateCategoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
