//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/add_category_tag_dto.dart';
import 'package:openapi/src/model/add_or_remove_single_category_dto.dart';
import 'package:openapi/src/model/category_dto.dart';
import 'package:openapi/src/model/category_tag_dto.dart';
import 'package:openapi/src/model/create_category_dto.dart';
import 'package:openapi/src/model/create_category_tag_dto.dart';
import 'package:openapi/src/model/media_item_dto.dart';
import 'package:openapi/src/model/patch_category_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddCategoryTagDto,
  AddOrRemoveSingleCategoryDto,
  CategoryDto,
  CategoryTagDto,
  CreateCategoryDto,
  CreateCategoryTagDto,
  MediaItemDto,
  PatchCategoryDto,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CategoryDto)]),
        () => ListBuilder<CategoryDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(MediaItemDto)]),
        () => ListBuilder<MediaItemDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CategoryTagDto)]),
        () => ListBuilder<CategoryTagDto>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
