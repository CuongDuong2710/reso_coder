import 'package:dart_built_value/model/built_vehicle.dart';

class CodeRunner {
  static void runCode() {
    var car = BuiltVehicle((b) => b..type = 'car'
    ..price= 100000);

    var copiedCar = car.rebuild((b) => b..brand = 'BMW'); // rebuild to create new instance, not change 'car'

    print(car);
    print(copiedCar);

    // They are not of the same object, they don't hold same reference to the memory
    // But in the case of value classed, these two objects are the same because they hold the same data

/* ══╡ EXCEPTION CAUGHT BY GESTURE ╞═══════════════════════════════════════════════════════════════════
The following BuiltValueNullFieldError was thrown while handling a gesture:
Tried to construct class "BuiltVehicle" with null field "brand". This is forbidden; to allow it,
mark "brand" with @nullable. */
  }
}