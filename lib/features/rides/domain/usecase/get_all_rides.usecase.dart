
import '../entity/requested_ride.dart';
import '../respository_impl/requested_ride_repository_impl.dart';

class GetAllRideRequestsForUserUseCase {
  final RideRequestRepositoryImpl rideRequestRepository;

  GetAllRideRequestsForUserUseCase(this.rideRequestRepository);

  Future<List<RideRequestEntity>> call(String userId) async {
    return await rideRequestRepository.getAllRideRequestsForUser(userId);
  }
}
