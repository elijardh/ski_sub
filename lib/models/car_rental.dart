import 'package:flutter/material.dart';

class CarRental {
  int? id;
  int? user;
  int? car;
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? pickupTime;
  TimeOfDay? dropoffTime;
  int? age;
  bool? isApproved;
  double? totalAmount;
  String? pickupLocation;
  String? dropoffLocation;

  CarRental({
    this.id,
    this.user,
    this.car,
    this.startDate,
    this.endDate,
    this.pickupTime,
    this.dropoffTime,
    this.age,
    this.isApproved,
    this.totalAmount,
    this.pickupLocation,
    this.dropoffLocation,
  });

  factory CarRental.fromJson(Map<String, dynamic> json) {
    return CarRental(
      id: json['id'] as int?,
      user: json['user'] as int?,
      car: json['car'] as int?,
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      pickupTime:
          json['pickup_time'] != null ? _parseTime(json['pickup_time']) : null,
      dropoffTime: json['dropoff_time'] != null
          ? _parseTime(json['dropoff_time'])
          : null,
      age: json['age'] as int?,
      isApproved: json['is_approved'] as bool?,
      totalAmount: json['total_amount'] == null
          ? null
          : double.tryParse(json['total_amount']),
      pickupLocation: json['pickup_location'] as String?,
      dropoffLocation: json['dropoff_location'] as String?,
    );
  }

  static TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'car': car,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'pickup_time': pickupTime != null
          ? '${pickupTime!.hour}:${pickupTime!.minute}'
          : null,
      'dropoff_time': dropoffTime != null
          ? '${dropoffTime!.hour}:${dropoffTime!.minute}'
          : null,
      'age': age,
      'is_approved': isApproved,
      'total_amount': totalAmount,
      'pickup_location': pickupLocation,
      'dropoff_location': dropoffLocation,
    };
  }
}
