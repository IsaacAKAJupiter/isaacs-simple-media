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

  factory _$CreateCategoryDto(
          [void Function(CreateCategoryDtoBuilder)? updates]) =>
      (CreateCategoryDtoBuilder()..update(updates))._build();

  _$CreateCategoryDto._(
      {required this.name, this.description, this.thumbnailMediaID})
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
        thumbnailMediaID == other.thumbnailMediaID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumbnailMediaID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCategoryDto')
          ..add('name', name)
          ..add('description', description)
          ..add('thumbnailMediaID', thumbnailMediaID))
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

  CreateCategoryDtoBuilder() {
    CreateCategoryDto._defaults(this);
  }

  CreateCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _thumbnailMediaID = $v.thumbnailMediaID;
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
    final _$result = _$v ??
        _$CreateCategoryDto._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CreateCategoryDto', 'name'),
          description: description,
          thumbnailMediaID: thumbnailMediaID,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
