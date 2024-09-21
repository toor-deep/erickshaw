
import '../respository_impl/requested_ride_repository_impl.dart';

class SendRequestParams {
  final String startLocation;
  final String endLocation;
  final String vehicleType;
  final double price;
  final String userId;

  SendRequestParams({
    required this.startLocation,
    required this.endLocation,
    required this.price,
    required this.vehicleType,
    required this. userId
  });
}

class SendRideRequestUseCase {
  final RideRequestRepositoryImpl rideRequestRepository;

  SendRideRequestUseCase(this.rideRequestRepository);

  Future<void> call(SendRequestParams params) async {
    return await rideRequestRepository.sendRideRequest(
        startLocation: params.startLocation,
        price: params.price,
        userId: params.userId,
        endLocation: params.endLocation,
        vehicleType: params.vehicleType);
  }
}
