// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_vehicle;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BuiltVehicle extends BuiltVehicle {
  @override
  final String type;
  @override
  final String brand;
  @override
  final double price;
  @override
  final bool someValueNullable;
  @override
  final BuiltList<String> passengerNames;

  factory _$BuiltVehicle([void updates(BuiltVehicleBuilder b)]) =>
      (new BuiltVehicleBuilder()..update(updates)).build();

  _$BuiltVehicle._(
      {this.type,
      this.brand,
      this.price,
      this.someValueNullable,
      this.passengerNames})
      : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'type');
    }
    if (brand == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'brand');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'price');
    }
    if (passengerNames == null) {
      throw new BuiltValueNullFieldError('BuiltVehicle', 'passengerNames');
    }
  }

  @override
  BuiltVehicle rebuild(void updates(BuiltVehicleBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltVehicleBuilder toBuilder() => new BuiltVehicleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltVehicle &&
        type == other.type &&
        brand == other.brand &&
        price == other.price &&
        someValueNullable == other.someValueNullable &&
        passengerNames == other.passengerNames;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, type.hashCode), brand.hashCode), price.hashCode),
            someValueNullable.hashCode),
        passengerNames.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltVehicle')
          ..add('type', type)
          ..add('brand', brand)
          ..add('price', price)
          ..add('someValueNullable', someValueNullable)
          ..add('passengerNames', passengerNames))
        .toString();
  }
}

class BuiltVehicleBuilder
    implements Builder<BuiltVehicle, BuiltVehicleBuilder> {
  _$BuiltVehicle _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _brand;
  String get brand => _$this._brand;
  set brand(String brand) => _$this._brand = brand;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  bool _someValueNullable;
  bool get someValueNullable => _$this._someValueNullable;
  set someValueNullable(bool someValueNullable) =>
      _$this._someValueNullable = someValueNullable;

  ListBuilder<String> _passengerNames;
  ListBuilder<String> get passengerNames =>
      _$this._passengerNames ??= new ListBuilder<String>();
  set passengerNames(ListBuilder<String> passengerNames) =>
      _$this._passengerNames = passengerNames;

  BuiltVehicleBuilder();

  BuiltVehicleBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _brand = _$v.brand;
      _price = _$v.price;
      _someValueNullable = _$v.someValueNullable;
      _passengerNames = _$v.passengerNames?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltVehicle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltVehicle;
  }

  @override
  void update(void updates(BuiltVehicleBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltVehicle build() {
    _$BuiltVehicle _$result;
    try {
      _$result = _$v ??
          new _$BuiltVehicle._(
              type: type,
              brand: brand,
              price: price,
              someValueNullable: someValueNullable,
              passengerNames: passengerNames.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'passengerNames';
        passengerNames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltVehicle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
