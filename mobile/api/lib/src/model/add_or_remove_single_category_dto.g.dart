// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_remove_single_category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddOrRemoveSingleCategoryDto extends AddOrRemoveSingleCategoryDto {
  @override
  final String categoryID;

  factory _$AddOrRemoveSingleCategoryDto(
          [void Function(AddOrRemoveSingleCategoryDtoBuilder)? updates]) =>
      (AddOrRemoveSingleCategoryDtoBuilder()..update(updates))._build();

  _$AddOrRemoveSingleCategoryDto._({required this.categoryID}) : super._();
  @override
  AddOrRemoveSingleCategoryDto rebuild(
          void Function(AddOrRemoveSingleCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOrRemoveSingleCategoryDtoBuilder toBuilder() =>
      AddOrRemoveSingleCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOrRemoveSingleCategoryDto &&
        categoryID == other.categoryID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddOrRemoveSingleCategoryDto')
          ..add('categoryID', categoryID))
        .toString();
  }
}

class AddOrRemoveSingleCategoryDtoBuilder
    implements
        Builder<AddOrRemoveSingleCategoryDto,
            AddOrRemoveSingleCategoryDtoBuilder> {
  _$AddOrRemoveSingleCategoryDto? _$v;

  String? _categoryID;
  String? get categoryID => _$this._categoryID;
  set categoryID(String? categoryID) => _$this._categoryID = categoryID;

  AddOrRemoveSingleCategoryDtoBuilder() {
    AddOrRemoveSingleCategoryDto._defaults(this);
  }

  AddOrRemoveSingleCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryID = $v.categoryID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOrRemoveSingleCategoryDto other) {
    _$v = other as _$AddOrRemoveSingleCategoryDto;
  }

  @override
  void update(void Function(AddOrRemoveSingleCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddOrRemoveSingleCategoryDto build() => _build();

  _$AddOrRemoveSingleCategoryDto _build() {
    final _$result = _$v ??
        _$AddOrRemoveSingleCategoryDto._(
          categoryID: BuiltValueNullFieldError.checkNotNull(
              categoryID, r'AddOrRemoveSingleCategoryDto', 'categoryID'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
