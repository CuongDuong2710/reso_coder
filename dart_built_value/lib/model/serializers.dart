library serializers;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_built_value/model/built_vehicle.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BuiltVehicle,
  VehicleType
])
final Serializers serializers = _$serializers;