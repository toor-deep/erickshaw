import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erickshawapp/core/api/api_url.dart';
import '../model/ride_request_model.dart';

abstract class RideRequestDataSource {
  Future<void> sendRideRequest({
    required String startLocation,
    required String endLocation,
    required String vehicleType,
  });

  Future<RideRequest> getRideRequestDetails(String requestId);

  Future<void> cancelRideRequest(String requestId);
}

class FirestoreRideRequestDataSource implements RideRequestDataSource {
  @override
  Future<void> sendRideRequest({
    required String startLocation,
    required String endLocation,
    required String vehicleType,
  }) async {
    try {
      final rideRequestRef = ApiUrl.requested_rides.doc();

      final rideRequest = RideRequest(
        id: rideRequestRef.id,
        startLocation: startLocation,
        endLocation: endLocation,
        vehicleType: vehicleType,
        status: 'pending',
        createdAt: Timestamp.now(),
      );

      await rideRequestRef.set(rideRequest.toMap());
    } catch (e) {
      throw Exception('Failed to send ride request: $e');
    }
  }

  @override
  Future<RideRequest> getRideRequestDetails(String requestId) async {
    try {
      final doc = await ApiUrl.requested_rides.doc(requestId).get();

      if (doc.exists) {
        return RideRequest.fromMap(doc.data()!);
      } else {
        throw Exception('Ride request not found');
      }
    } catch (e) {
      throw Exception('Failed to get ride request details: $e');
    }
  }

  @override
  Future<void> cancelRideRequest(String requestId) async {
    try {
      await ApiUrl.requested_rides.doc(requestId).update({
        'status': 'cancelled',
      });
    } catch (e) {
      throw Exception('Failed to cancel ride request: $e');
    }
  }
}
