import 'package:erickshawapp/features/book_ride/domain/entity/requested_ride.dart';

import '../../data/data_source/ride_request_data_source.dart';
import '../../data/model/ride_request_model.dart';
import '../../data/repositroy/requested_ride_repository.dart';

class RideRequestRepositoryImpl implements RideRequestRepository {
  final RideRequestDataSource dataSource;

  RideRequestRepositoryImpl(this.dataSource);

  @override
  Future<void> sendRideRequest({
    required String startLocation,
    required String endLocation,
    required String vehicleType,
  }) async {
    try {
      await dataSource.sendRideRequest(
        startLocation: startLocation,
        endLocation: endLocation,
        vehicleType: vehicleType,
      );
    } catch (e) {
      throw Exception('Failed to send ride request: $e');
    }
  }

  @override
  Future<RideRequestEntity> getRideRequestDetails(String requestId) async {
    try {
      final data=await dataSource.getRideRequestDetails(requestId);

    } catch (e) {
      throw Exception('Failed to get ride request details: $e');
    }
  }
  //
  @override
  Future<void> cancelRideRequest(String requestId) async {
    try {
      await dataSource.cancelRideRequest(requestId);
    } catch (e) {
      throw Exception('Failed to cancel ride request: $e');
    }
  }
}
