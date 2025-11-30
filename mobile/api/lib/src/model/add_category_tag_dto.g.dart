// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_tag_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddCategoryTagDto extends AddCategoryTagDto {
  @override
  final num tagID;

  factory _$AddCategoryTagDto(
          [void Function(AddCategoryTagDtoBuilder)? updates]) =>
      (AddCategoryTagDtoBuilder()..update(updates))._build();

  _$AddCategoryTagDto._({required this.tagID}) : super._();
  @override
  AddCategoryTagDto rebuild(void Function(AddCategoryTagDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddCategoryTagDtoBuilder toBuilder() =>
      AddCategoryTagDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddCategoryTagDto && tagID == other.tagID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tagID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddCategoryTagDto')
          ..add('tagID', tagID))
        .toString();
  }
}

class AddCategoryTagDtoBuilder
    implements Builder<AddCategoryTagDto, AddCategoryTagDtoBuilder> {
  _$AddCategoryTagDto? _$v;

  num? _tagID;
  num? get tagID => _$this._tagID;
  set tagID(num? tagID) => _$this._tagID = tagID;

  AddCategoryTagDtoBuilder() {
    AddCategoryTagDto._defaults(this);
  }

  AddCategoryTagDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tagID = $v.tagID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddCategoryTagDto other) {
    _$v = other as _$AddCategoryTagDto;
  }

  @override
  void update(void Function(AddCategoryTagDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddCategoryTagDto build() => _build();

  _$AddCategoryTagDto _build() {
    final _$result = _$v ??
        _$AddCategoryTagDto._(
          tagID: BuiltValueNullFieldError.checkNotNull(
              tagID, r'AddCategoryTagDto', 'tagID'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
