import 'package:equatable/equatable.dart';

class PreBookRideEntity extends Equatable {
  final String userId;
  final DateTime date;
  final String time;
  final String startLocation;
  final String endLocation;
  final String vehicleType;
  final double price;
  final String status;
  final DateTime createdAt;

  const PreBookRideEntity({
    required this.userId,
    required this.date,
    required this.time,
    required this.startLocation,
    required this.endLocation,
    required this.vehicleType,
    required this.price,
    required this.createdAt,
    this.status = 'pending',
  });

  @override
  List<Object?> get props => [
    userId,
    date,
    time,
    startLocation,
    endLocation,
    vehicleType,
    price,
    status,
  ];
}
