//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_category_tag_dto.g.dart';

/// AddCategoryTagDto
///
/// Properties:
/// * [tagID] - The unique identifier for the category tag.
@BuiltValue()
abstract class AddCategoryTagDto implements Built<AddCategoryTagDto, AddCategoryTagDtoBuilder> {
  /// The unique identifier for the category tag.
  @BuiltValueField(wireName: r'tagID')
  num get tagID;

  AddCategoryTagDto._();

  factory AddCategoryTagDto([void updates(AddCategoryTagDtoBuilder b)]) = _$AddCategoryTagDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddCategoryTagDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddCategoryTagDto> get serializer => _$AddCategoryTagDtoSerializer();
}

class _$AddCategoryTagDtoSerializer implements PrimitiveSerializer<AddCategoryTagDto> {
  @override
  final Iterable<Type> types = const [AddCategoryTagDto, _$AddCategoryTagDto];

  @override
  final String wireName = r'AddCategoryTagDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddCategoryTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'tagID';
    yield serializers.serialize(
      object.tagID,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddCategoryTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddCategoryTagDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'tagID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.tagID = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddCategoryTagDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddCategoryTagDtoBuilder();
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

