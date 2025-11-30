// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_tag_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CategoryTagDto extends CategoryTagDto {
  @override
  final num id;
  @override
  final String name;
  @override
  final String colour;

  factory _$CategoryTagDto([void Function(CategoryTagDtoBuilder)? updates]) =>
      (CategoryTagDtoBuilder()..update(updates))._build();

  _$CategoryTagDto._(
      {required this.id, required this.name, required this.colour})
      : super._();
  @override
  CategoryTagDto rebuild(void Function(CategoryTagDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryTagDtoBuilder toBuilder() => CategoryTagDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryTagDto &&
        id == other.id &&
        name == other.name &&
        colour == other.colour;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, colour.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryTagDto')
          ..add('id', id)
          ..add('name', name)
          ..add('colour', colour))
        .toString();
  }
}

class CategoryTagDtoBuilder
    implements Builder<CategoryTagDto, CategoryTagDtoBuilder> {
  _$CategoryTagDto? _$v;

  num? _id;
  num? get id => _$this._id;
  set id(num? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _colour;
  String? get colour => _$this._colour;
  set colour(String? colour) => _$this._colour = colour;

  CategoryTagDtoBuilder() {
    CategoryTagDto._defaults(this);
  }

  CategoryTagDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _colour = $v.colour;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryTagDto other) {
    _$v = other as _$CategoryTagDto;
  }

  @override
  void update(void Function(CategoryTagDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryTagDto build() => _build();

  _$CategoryTagDto _build() {
    final _$result = _$v ??
        _$CategoryTagDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CategoryTagDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CategoryTagDto', 'name'),
          colour: BuiltValueNullFieldError.checkNotNull(
              colour, r'CategoryTagDto', 'colour'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
