import 'package:meta/meta.dart';
import 'dart:math';


class Beepable{
  String _sound;
  Beepable(this._sound);
}

class Vehicle{
  String color;
  String brand;
  int maxSpeed;
  final bool _isAutomaticGearbox;
  int? mileage;


  Vehicle(): color='', brand='', maxSpeed=0, _isAutomaticGearbox=false;
  
  Vehicle.some(this.brand ,this.maxSpeed, this._isAutomaticGearbox, [this.color='white']);

  Vehicle.custom({this.color='', this.brand='' , this.maxSpeed=0, @required isAutomaticGearbox}): _isAutomaticGearbox = isAutomaticGearbox;

  String get isAutomaticGearbox => _isAutomaticGearbox ? 'Automatic Gearbox': 'Manual Gearbox';

  String get showSpeed => '$maxSpeed km/h';
  String get showMileage => '${mileage ?? 0} km';

  set speed(int speedValue) => maxSpeed = speedValue;
  set startMileage(int startMileage) => mileage ??= startMileage;

  @override
  String toString() => 'Vehicle $color $brand';

}

class Truck extends Vehicle implements Beepable{
  final int bearingCapacity;
  Truck({this.bearingCapacity=0, isAutomatic=true, @required color, @required brand}): super.custom(isAutomaticGearbox: isAutomatic, color: color, brand: brand);

  factory Truck.fact(int weight){
    print('weight: $weight');
    return weight > 5000 ? Truck(color: 'white', brand: 'Brand1', bearingCapacity: 10000) : Truck(color: 'black', brand: 'Brand2', isAutomatic: false, bearingCapacity: 3000);
  }

  @override
  String get _sound => '$_sound!!';

  @override
  set _sound(String someSound) => _sound = someSound;

  @override
  String toString() => 'Truck $color $brand with bearing capacity $bearingCapacity kg.';
}




Function paintCar(String color) => (Vehicle car) => car.color = color;


void main(List<String> arguments) {
  var sportCar = Vehicle.custom(color: 'red', brand: 'BMW', isAutomaticGearbox: true);
  print(sportCar);
  print(sportCar.showSpeed);
  print(sportCar.showMileage);
  sportCar
    ..speed = 350
    ..startMileage = 10000
    ..startMileage = 90000;
  print(sportCar.showSpeed);
  print(sportCar.showMileage);
  var anotherCar = Vehicle.some('Nissan', 250, false, 'yellow');
  print(anotherCar);
  print(anotherCar.isAutomaticGearbox);

  print('*' * 100);

  var paintBlue = paintCar('blue');
  var paintGreen = paintCar('green');

  paintBlue(sportCar);
  paintBlue(anotherCar);

  print(sportCar);
  print(anotherCar);

  paintGreen(sportCar);
  paintGreen(anotherCar);

  print(sportCar);
  print(anotherCar);

  print('*' * 100);

  var truck = Truck(bearingCapacity: 10000, isAutomatic: true, color: 'orange', brand: 'MAN');
  print(truck);

  var random = Random();
  var truckFactory = Truck.fact(random.nextInt(10000));
  print(truckFactory);

  print('*' * 100);
  List <int> numbers = [1,2,3,4,5];
  numbers
    ..add(11)
    ..addAll([12, 13, 14, 15]);
  print(numbers);
  var filtered = numbers.map((e) => pow(e, 2)).where((element) => element < 100);
  print(filtered);
  num sum = filtered.reduce((x, y) => x * y);
  print(sum);
  var anotherList = [...numbers, for(var i in numbers) i * 2, if(numbers.reduce((x, y) => x + y) < 100) 1000];
  print(anotherList);
  Set <String> stringSet = {'Messi', 'Ronado', 'Messi', 'Messi', 'Messi', 'Ronado', 'Ronado'};
  stringSet.addAll({'Shevchenko', 'Messi'});
  print(stringSet);
  var map = {'one': 1, 'two': 2, 'three': 3};
  Map<String, int> secondMap = {'four': 4, 'six': 6};
  map.addAll(secondMap);
  map.forEach((key, value) {
    print('map[$key] = $value');
  });
}
