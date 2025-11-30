//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_category_dto.g.dart';

/// CreateCategoryDto
///
/// Properties:
/// * [name] - The name of the category.
/// * [description] - The description of the category.
/// * [thumbnailMediaID] - The media item ID to use for the category.
/// * [tags] - Array of tag IDs for the category
@BuiltValue()
abstract class CreateCategoryDto implements Built<CreateCategoryDto, CreateCategoryDtoBuilder> {
  /// The name of the category.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// The description of the category.
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// The media item ID to use for the category.
  @BuiltValueField(wireName: r'thumbnailMediaID')
  String? get thumbnailMediaID;

  /// Array of tag IDs for the category
  @BuiltValueField(wireName: r'tags')
  BuiltList<num>? get tags;

  CreateCategoryDto._();

  factory CreateCategoryDto([void updates(CreateCategoryDtoBuilder b)]) = _$CreateCategoryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCategoryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCategoryDto> get serializer => _$CreateCategoryDtoSerializer();
}

class _$CreateCategoryDtoSerializer implements PrimitiveSerializer<CreateCategoryDto> {
  @override
  final Iterable<Type> types = const [CreateCategoryDto, _$CreateCategoryDto];

  @override
  final String wireName = r'CreateCategoryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.thumbnailMediaID != null) {
      yield r'thumbnailMediaID';
      yield serializers.serialize(
        object.thumbnailMediaID,
        specifiedType: const FullType(String),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(num)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCategoryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'thumbnailMediaID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.thumbnailMediaID = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(num)]),
          ) as BuiltList<num>;
          result.tags.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateCategoryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCategoryDtoBuilder();
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

