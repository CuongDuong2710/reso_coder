// GENERATED CODE - DO NOT MODIFY BY HAND

part of detail_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShowDetail extends ShowDetail {
  factory _$ShowDetail([void updates(ShowDetailBuilder b)]) =>
      (new ShowDetailBuilder()..update(updates)).build();

  _$ShowDetail._() : super._();

  @override
  ShowDetail rebuild(void updates(ShowDetailBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowDetailBuilder toBuilder() => new ShowDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowDetail;
  }

  @override
  int get hashCode {
    return 845526220;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ShowDetail').toString();
  }
}

class ShowDetailBuilder implements Builder<ShowDetail, ShowDetailBuilder> {
  _$ShowDetail _$v;

  ShowDetailBuilder();

  @override
  void replace(ShowDetail other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShowDetail;
  }

  @override
  void update(void updates(ShowDetailBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ShowDetail build() {
    final _$result = _$v ?? new _$ShowDetail._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
