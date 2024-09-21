import 'package:dartz/dartz.dart';
import 'package:erickshawapp/features/rides/domain/respository_impl/requested_ride_repository_impl.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';


class SendPreBookRideRequestUseCase implements UseCase<void, PreBookRideParams> {
  final RideRequestRepositoryImpl repository;

  SendPreBookRideRequestUseCase(this.repository);

  @override
  Future<void> call(PreBookRideParams params) async {
    return await repository.sendPreBookRideRequest(
      userId: params.userId,
      date: params.date,
      time: params.time,
      startLocation: params.startLocation,
      endLocation: params.endLocation,
      vehicleType: params.vehicleType,
      price: params.price,

    );
  }
}

class PreBookRideParams {
  final String userId;
  final DateTime date;
  final String time;
  final String startLocation;
  final String endLocation;
  final String vehicleType;
  final double price;

  PreBookRideParams({
    required this.userId,
    required this.date,
    required this.time,
    required this.startLocation,
    required this.endLocation,
    required this.vehicleType,
    required this.price,
  });
}
