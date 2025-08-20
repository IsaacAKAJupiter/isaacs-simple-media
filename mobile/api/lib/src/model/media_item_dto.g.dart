// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaItemDto extends MediaItemDto {
  @override
  final String id;
  @override
  final String fileName;
  @override
  final String extension_;
  @override
  final num size;
  @override
  final String contentHash;
  @override
  final String mediaType;
  @override
  final JsonObject? thumbnailPath;
  @override
  final DateTime createdAt;
  @override
  final JsonObject? recycledAt;

  factory _$MediaItemDto([void Function(MediaItemDtoBuilder)? updates]) =>
      (MediaItemDtoBuilder()..update(updates))._build();

  _$MediaItemDto._(
      {required this.id,
      required this.fileName,
      required this.extension_,
      required this.size,
      required this.contentHash,
      required this.mediaType,
      this.thumbnailPath,
      required this.createdAt,
      this.recycledAt})
      : super._();
  @override
  MediaItemDto rebuild(void Function(MediaItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaItemDtoBuilder toBuilder() => MediaItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaItemDto &&
        id == other.id &&
        fileName == other.fileName &&
        extension_ == other.extension_ &&
        size == other.size &&
        contentHash == other.contentHash &&
        mediaType == other.mediaType &&
        thumbnailPath == other.thumbnailPath &&
        createdAt == other.createdAt &&
        recycledAt == other.recycledAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, extension_.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, contentHash.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, thumbnailPath.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recycledAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaItemDto')
          ..add('id', id)
          ..add('fileName', fileName)
          ..add('extension_', extension_)
          ..add('size', size)
          ..add('contentHash', contentHash)
          ..add('mediaType', mediaType)
          ..add('thumbnailPath', thumbnailPath)
          ..add('createdAt', createdAt)
          ..add('recycledAt', recycledAt))
        .toString();
  }
}

class MediaItemDtoBuilder
    implements Builder<MediaItemDto, MediaItemDtoBuilder> {
  _$MediaItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _extension_;
  String? get extension_ => _$this._extension_;
  set extension_(String? extension_) => _$this._extension_ = extension_;

  num? _size;
  num? get size => _$this._size;
  set size(num? size) => _$this._size = size;

  String? _contentHash;
  String? get contentHash => _$this._contentHash;
  set contentHash(String? contentHash) => _$this._contentHash = contentHash;

  String? _mediaType;
  String? get mediaType => _$this._mediaType;
  set mediaType(String? mediaType) => _$this._mediaType = mediaType;

  JsonObject? _thumbnailPath;
  JsonObject? get thumbnailPath => _$this._thumbnailPath;
  set thumbnailPath(JsonObject? thumbnailPath) =>
      _$this._thumbnailPath = thumbnailPath;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  JsonObject? _recycledAt;
  JsonObject? get recycledAt => _$this._recycledAt;
  set recycledAt(JsonObject? recycledAt) => _$this._recycledAt = recycledAt;

  MediaItemDtoBuilder() {
    MediaItemDto._defaults(this);
  }

  MediaItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fileName = $v.fileName;
      _extension_ = $v.extension_;
      _size = $v.size;
      _contentHash = $v.contentHash;
      _mediaType = $v.mediaType;
      _thumbnailPath = $v.thumbnailPath;
      _createdAt = $v.createdAt;
      _recycledAt = $v.recycledAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaItemDto other) {
    _$v = other as _$MediaItemDto;
  }

  @override
  void update(void Function(MediaItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaItemDto build() => _build();

  _$MediaItemDto _build() {
    final _$result = _$v ??
        _$MediaItemDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'MediaItemDto', 'id'),
          fileName: BuiltValueNullFieldError.checkNotNull(
              fileName, r'MediaItemDto', 'fileName'),
          extension_: BuiltValueNullFieldError.checkNotNull(
              extension_, r'MediaItemDto', 'extension_'),
          size: BuiltValueNullFieldError.checkNotNull(
              size, r'MediaItemDto', 'size'),
          contentHash: BuiltValueNullFieldError.checkNotNull(
              contentHash, r'MediaItemDto', 'contentHash'),
          mediaType: BuiltValueNullFieldError.checkNotNull(
              mediaType, r'MediaItemDto', 'mediaType'),
          thumbnailPath: thumbnailPath,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'MediaItemDto', 'createdAt'),
          recycledAt: recycledAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
