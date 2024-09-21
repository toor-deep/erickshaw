import 'package:erickshawapp/features/rides/domain/entity/pre_book_ride_entity.dart';
import '../respository_impl/requested_ride_repository_impl.dart';

class GetAllPreBookRideRequestsForUserUseCase {
  final RideRequestRepositoryImpl rideRequestRepository;

  GetAllPreBookRideRequestsForUserUseCase(this.rideRequestRepository);

  Future<List<PreBookRideEntity>> call(String userId) async {
    return await rideRequestRepository.getAllPreBookRidesForUser(userId);
  }
}
