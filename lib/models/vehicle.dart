import 'image.dart';
import 'model.dart';

class Vehicle {
  int? id;
  Model? model;
  int? year;
  bool? available;
  String? pricePerDay;
  List<Image>? image;
  int? numberOfPassengers;
  int? numberOfDoors;
  bool? airConditioning;
  String? transmission;
  String? fuelType;
  int? maxPowerHp;
  int? topSpeedMph;

  Vehicle({
    this.id,
    this.model,
    this.year,
    this.available,
    this.pricePerDay,
    this.image,
    this.numberOfPassengers,
    this.numberOfDoors,
    this.airConditioning,
    this.transmission,
    this.fuelType,
    this.maxPowerHp,
    this.topSpeedMph,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'] as int?,
        model: json['model'] == null
            ? null
            : Model.fromJson(json['model'] as Map<String, dynamic>),
        year: json['year'] as int?,
        available: json['available'] as bool?,
        pricePerDay: json['price_per_day'] as String?,
        image: (json['image'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        numberOfPassengers: json['number_of_passengers'] as int?,
        numberOfDoors: json['number_of_doors'] as int?,
        airConditioning: json['air_conditioning'] as bool?,
        transmission: json['transmission'] as String?,
        fuelType: json['fuel_type'] as String?,
        maxPowerHp: json['max_power_hp'] as int?,
        topSpeedMph: json['top_speed_mph'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'model': model?.toJson(),
        'year': year,
        'available': available,
        'price_per_day': pricePerDay,
        'image': image?.map((e) => e.toJson()).toList(),
        'number_of_passengers': numberOfPassengers,
        'number_of_doors': numberOfDoors,
        'air_conditioning': airConditioning,
        'transmission': transmission,
        'fuel_type': fuelType,
        'max_power_hp': maxPowerHp,
        'top_speed_mph': topSpeedMph,
      };
}
