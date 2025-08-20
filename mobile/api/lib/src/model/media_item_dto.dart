//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_item_dto.g.dart';

/// MediaItemDto
///
/// Properties:
/// * [id] - The unique identifier for the media item.
/// * [fileName] - The original filename of the media item.
/// * [extension_] - The file extension of the media item.
/// * [size] - The size of the file in bytes.
/// * [contentHash] - The SHA-256 content hash of the file.
/// * [mediaType] - The MIME type of the file.
/// * [thumbnailPath] - Path to a generated thumbnail for video files.
/// * [createdAt] 
/// * [recycledAt] - If set, the item is considered in the trash.
@BuiltValue()
abstract class MediaItemDto implements Built<MediaItemDto, MediaItemDtoBuilder> {
  /// The unique identifier for the media item.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// The original filename of the media item.
  @BuiltValueField(wireName: r'fileName')
  String get fileName;

  /// The file extension of the media item.
  @BuiltValueField(wireName: r'extension')
  String get extension_;

  /// The size of the file in bytes.
  @BuiltValueField(wireName: r'size')
  num get size;

  /// The SHA-256 content hash of the file.
  @BuiltValueField(wireName: r'contentHash')
  String get contentHash;

  /// The MIME type of the file.
  @BuiltValueField(wireName: r'mediaType')
  String get mediaType;

  /// Path to a generated thumbnail for video files.
  @BuiltValueField(wireName: r'thumbnailPath')
  JsonObject? get thumbnailPath;

  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// If set, the item is considered in the trash.
  @BuiltValueField(wireName: r'recycledAt')
  JsonObject? get recycledAt;

  MediaItemDto._();

  factory MediaItemDto([void updates(MediaItemDtoBuilder b)]) = _$MediaItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaItemDto> get serializer => _$MediaItemDtoSerializer();
}

class _$MediaItemDtoSerializer implements PrimitiveSerializer<MediaItemDto> {
  @override
  final Iterable<Type> types = const [MediaItemDto, _$MediaItemDto];

  @override
  final String wireName = r'MediaItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'fileName';
    yield serializers.serialize(
      object.fileName,
      specifiedType: const FullType(String),
    );
    yield r'extension';
    yield serializers.serialize(
      object.extension_,
      specifiedType: const FullType(String),
    );
    yield r'size';
    yield serializers.serialize(
      object.size,
      specifiedType: const FullType(num),
    );
    yield r'contentHash';
    yield serializers.serialize(
      object.contentHash,
      specifiedType: const FullType(String),
    );
    yield r'mediaType';
    yield serializers.serialize(
      object.mediaType,
      specifiedType: const FullType(String),
    );
    yield r'thumbnailPath';
    yield object.thumbnailPath == null ? null : serializers.serialize(
      object.thumbnailPath,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'recycledAt';
    yield object.recycledAt == null ? null : serializers.serialize(
      object.recycledAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'fileName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileName = valueDes;
          break;
        case r'extension':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.extension_ = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.size = valueDes;
          break;
        case r'contentHash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentHash = valueDes;
          break;
        case r'mediaType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mediaType = valueDes;
          break;
        case r'thumbnailPath':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.thumbnailPath = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'recycledAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.recycledAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaItemDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

