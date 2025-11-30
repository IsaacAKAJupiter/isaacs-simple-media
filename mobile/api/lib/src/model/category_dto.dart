//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/category_tag_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/media_item_dto.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category_dto.g.dart';

/// CategoryDto
///
/// Properties:
/// * [id] - Unique identifier for the category
/// * [name] - Name of the category
/// * [description] - Description of the category
/// * [thumbnail] - Thumbnail media item
/// * [createdAt] - Creation date of the category
/// * [updatedAt] - Last update date of the category
/// * [tags] - Tags associated with the category
/// * [mediaItems] - List of media items associated with the category
@BuiltValue()
abstract class CategoryDto implements Built<CategoryDto, CategoryDtoBuilder> {
  /// Unique identifier for the category
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Name of the category
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Description of the category
  @BuiltValueField(wireName: r'description')
  JsonObject? get description;

  /// Thumbnail media item
  @BuiltValueField(wireName: r'thumbnail')
  MediaItemDto? get thumbnail;

  /// Creation date of the category
  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// Last update date of the category
  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  /// Tags associated with the category
  @BuiltValueField(wireName: r'tags')
  BuiltList<CategoryTagDto>? get tags;

  /// List of media items associated with the category
  @BuiltValueField(wireName: r'mediaItems')
  BuiltList<MediaItemDto>? get mediaItems;

  CategoryDto._();

  factory CategoryDto([void updates(CategoryDtoBuilder b)]) = _$CategoryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CategoryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CategoryDto> get serializer => _$CategoryDtoSerializer();
}

class _$CategoryDtoSerializer implements PrimitiveSerializer<CategoryDto> {
  @override
  final Iterable<Type> types = const [CategoryDto, _$CategoryDto];

  @override
  final String wireName = r'CategoryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield object.description == null ? null : serializers.serialize(
      object.description,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'thumbnail';
    yield object.thumbnail == null ? null : serializers.serialize(
      object.thumbnail,
      specifiedType: const FullType.nullable(MediaItemDto),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(CategoryTagDto)]),
      );
    }
    yield r'mediaItems';
    yield object.mediaItems == null ? null : serializers.serialize(
      object.mediaItems,
      specifiedType: const FullType.nullable(BuiltList, [FullType(MediaItemDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CategoryDtoBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'thumbnail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MediaItemDto),
          ) as MediaItemDto?;
          if (valueDes == null) continue;
          result.thumbnail.replace(valueDes);
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CategoryTagDto)]),
          ) as BuiltList<CategoryTagDto>;
          result.tags.replace(valueDes);
          break;
        case r'mediaItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MediaItemDto)]),
          ) as BuiltList<MediaItemDto>?;
          if (valueDes == null) continue;
          result.mediaItems.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CategoryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CategoryDtoBuilder();
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

