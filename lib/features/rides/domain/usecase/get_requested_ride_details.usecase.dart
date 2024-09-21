
import '../entity/requested_ride.dart';
import '../respository_impl/requested_ride_repository_impl.dart';


class GetRideRequestParams {
  final String requestId;

  GetRideRequestParams({required this.requestId});
}

class GetRideRequestDetailsUseCase {
  final RideRequestRepositoryImpl rideRequestRepository;

  GetRideRequestDetailsUseCase(this.rideRequestRepository);

  Future<RideRequestEntity> call(GetRideRequestParams params) async {
    return await rideRequestRepository.getRideRequestDetails(params.requestId);
  }
}
