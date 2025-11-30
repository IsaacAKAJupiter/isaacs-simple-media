//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_category_tag_dto.g.dart';

/// CreateCategoryTagDto
///
/// Properties:
/// * [name] - Name of the tag
/// * [colour] - Colour of the tag as hex code
@BuiltValue()
abstract class CreateCategoryTagDto implements Built<CreateCategoryTagDto, CreateCategoryTagDtoBuilder> {
  /// Name of the tag
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Colour of the tag as hex code
  @BuiltValueField(wireName: r'colour')
  String get colour;

  CreateCategoryTagDto._();

  factory CreateCategoryTagDto([void updates(CreateCategoryTagDtoBuilder b)]) = _$CreateCategoryTagDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCategoryTagDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCategoryTagDto> get serializer => _$CreateCategoryTagDtoSerializer();
}

class _$CreateCategoryTagDtoSerializer implements PrimitiveSerializer<CreateCategoryTagDto> {
  @override
  final Iterable<Type> types = const [CreateCategoryTagDto, _$CreateCategoryTagDto];

  @override
  final String wireName = r'CreateCategoryTagDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCategoryTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    CreateCategoryTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCategoryTagDtoBuilder result,
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
  CreateCategoryTagDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCategoryTagDtoBuilder();
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

