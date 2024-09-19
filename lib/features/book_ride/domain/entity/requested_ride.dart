import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RideRequestEntity extends Equatable {
  final String id;
  final String startLocation;
  final String endLocation;
  final String vehicleType;
  final String status;
  final DateTime createdAt;

  const RideRequestEntity({
    required this.id,
    required this.startLocation,
    required this.endLocation,
    required this.vehicleType,
    required this.status,
    required this.createdAt,
  });

  factory RideRequestEntity.fromMap(Map<String, dynamic> map) {
    return RideRequestEntity(
      id: map['id'],
      startLocation: map['startLocation'],
      endLocation: map['endLocation'],
      vehicleType: map['vehicleType'],
      status: map['status'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  RideRequestEntity toMap() {
    return RideRequestEntity(
        id: id,
        startLocation: startLocation,
        endLocation: endLocation,
        vehicleType: vehicleType,
        status: status,
        createdAt: createdAt);
  }

  @override
  List<Object> get props =>
      [id, startLocation, endLocation, vehicleType, status, createdAt];
}
