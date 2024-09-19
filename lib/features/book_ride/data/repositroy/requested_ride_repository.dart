import 'package:erickshawapp/features/book_ride/domain/entity/requested_ride.dart';

abstract class RideRequestRepository {
  Future<void> sendRideRequest({
    required String startLocation,
    required String endLocation,
    required String vehicleType,
  });

  Future<RideRequestEntity> getRideRequestDetails(String requestId);

  Future<void> cancelRideRequest(String requestId);
}
