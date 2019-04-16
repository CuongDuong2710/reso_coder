library detail_event;

import 'package:built_value/built_value.dart';

part 'detail_event.g.dart';

abstract class DetailEvent {}

abstract class ShowDetail implements Built<ShowDetail, ShowDetailBuilder> {
  // fields go here

  ShowDetail._();

  factory ShowDetail([updates(ShowDetailBuilder b)]) = _$ShowDetail;
}
