import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RideRequest extends Equatable {
  final String id;
  final String startLocation;
  final String endLocation;
  final String vehicleType;
  final String status;
  final Timestamp createdAt;

  const RideRequest({
    required this.id,
    required this.startLocation,
    required this.endLocation,
    required this.vehicleType,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startLocation': startLocation,
      'endLocation': endLocation,
      'vehicleType': vehicleType,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory RideRequest.fromMap(Map<String, dynamic> map) {
    return RideRequest(
      id: map['id'] ?? '',
      startLocation: map['startLocation'] ?? '',
      endLocation: map['endLocation'] ?? '',
      vehicleType: map['vehicleType'] ?? '',
      status: map['status'] ?? 'pending',
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  @override
  List<Object> get props =>
      [id, startLocation, endLocation, vehicleType, status, createdAt];

  @override
  String toString() {
    return 'RideRequest{id: $id, startLocation: $startLocation, endLocation: $endLocation, vehicleType: $vehicleType, status: $status, createdAt: $createdAt}';
  }
}
