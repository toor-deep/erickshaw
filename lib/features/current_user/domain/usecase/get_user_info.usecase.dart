import 'package:erickshawapp/features/auth/domain/entities/auth_user.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/repository/user_repositroy.dart';

class GetUserUseCase implements UseCase<AuthUser?, String> {
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  @override
  Future<AuthUser?> call(String email) async {
    return await repository.getUserByEmail(email);
  }
}
