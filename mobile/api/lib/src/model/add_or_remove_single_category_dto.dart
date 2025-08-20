//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_or_remove_single_category_dto.g.dart';

/// AddOrRemoveSingleCategoryDto
///
/// Properties:
/// * [categoryID] - The unique identifier for the category.
@BuiltValue()
abstract class AddOrRemoveSingleCategoryDto implements Built<AddOrRemoveSingleCategoryDto, AddOrRemoveSingleCategoryDtoBuilder> {
  /// The unique identifier for the category.
  @BuiltValueField(wireName: r'categoryID')
  String get categoryID;

  AddOrRemoveSingleCategoryDto._();

  factory AddOrRemoveSingleCategoryDto([void updates(AddOrRemoveSingleCategoryDtoBuilder b)]) = _$AddOrRemoveSingleCategoryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddOrRemoveSingleCategoryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddOrRemoveSingleCategoryDto> get serializer => _$AddOrRemoveSingleCategoryDtoSerializer();
}

class _$AddOrRemoveSingleCategoryDtoSerializer implements PrimitiveSerializer<AddOrRemoveSingleCategoryDto> {
  @override
  final Iterable<Type> types = const [AddOrRemoveSingleCategoryDto, _$AddOrRemoveSingleCategoryDto];

  @override
  final String wireName = r'AddOrRemoveSingleCategoryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddOrRemoveSingleCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'categoryID';
    yield serializers.serialize(
      object.categoryID,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddOrRemoveSingleCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddOrRemoveSingleCategoryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'categoryID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.categoryID = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddOrRemoveSingleCategoryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddOrRemoveSingleCategoryDtoBuilder();
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

