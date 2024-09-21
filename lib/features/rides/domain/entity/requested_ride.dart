import 'package:equatable/equatable.dart';

class RideRequestEntity extends Equatable {
  final String id;
  final String startLocation;
  final String endLocation;
  final String vehicleType;
  final double price;
  final String status;
  final DateTime createdAt;

  const RideRequestEntity({
    required this.id,
    required this.startLocation,
    required this.endLocation,
    required this.vehicleType,
    required this.status,
    required this.price,
    required this.createdAt,
  });

  RideRequestEntity copyWith({
    String? id,
    String? startLocation,
    String? endLocation,
    String? vehicleType,
    String? status,
    double? price,
    DateTime? createdAt,
  }) {
    return RideRequestEntity(
      id: id ?? this.id,
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      vehicleType: vehicleType ?? this.vehicleType,
      status: status ?? this.status,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props => [
    id,
    startLocation,
    endLocation,
    vehicleType,
    status,
    price,
    createdAt,
  ];
}
