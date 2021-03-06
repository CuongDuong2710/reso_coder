import 'package:dart_built_value/model/built_vehicle.dart';

class CodeRunner {
  static void runCode() {
    var car = BuiltVehicle((b) => b..type = VehicleType.car
    ..brand= 'Tesla'
    ..price= 100000
    ..passengerNames.addAll(['Dane','Maria','David','Phil']));

    var copiedTrain = car.rebuild((b) => b..brand = 'BMW'
    ..type = VehicleType.train); // rebuild to create new instance, not change 'car'

    print(car);
    print(copiedTrain);

    final carJson = car.toJson();
    print(carJson); // ["type","car","brand","Tesla","price",100000.0,"passengerNames",["Dane","Maria","David","Phil"]]

    final carFromJson =
          BuiltVehicle.fromJson(carJson).rebuild((b) => b..price = 2000);
    print(carFromJson);

    // They are not of the same object, they don't hold same reference to the memory
    // But in the case of value classed, these two objects are the same because they hold the same data
  }
}