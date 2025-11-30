//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category_tag_dto.g.dart';

/// CategoryTagDto
///
/// Properties:
/// * [id] - ID of the tag
/// * [name] - Name of the tag
/// * [colour] - Colour of the tag as hex code
@BuiltValue()
abstract class CategoryTagDto implements Built<CategoryTagDto, CategoryTagDtoBuilder> {
  /// ID of the tag
  @BuiltValueField(wireName: r'id')
  num get id;

  /// Name of the tag
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Colour of the tag as hex code
  @BuiltValueField(wireName: r'colour')
  String get colour;

  CategoryTagDto._();

  factory CategoryTagDto([void updates(CategoryTagDtoBuilder b)]) = _$CategoryTagDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CategoryTagDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CategoryTagDto> get serializer => _$CategoryTagDtoSerializer();
}

class _$CategoryTagDtoSerializer implements PrimitiveSerializer<CategoryTagDto> {
  @override
  final Iterable<Type> types = const [CategoryTagDto, _$CategoryTagDto];

  @override
  final String wireName = r'CategoryTagDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CategoryTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'colour';
    yield serializers.serialize(
      object.colour,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CategoryTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CategoryTagDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'colour':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.colour = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CategoryTagDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CategoryTagDtoBuilder();
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

