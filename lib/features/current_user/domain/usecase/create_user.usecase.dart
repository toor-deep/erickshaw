
import 'package:erickshawapp/features/auth/domain/entities/auth_user.dart';
import 'package:erickshawapp/features/current_user/data/repository/user_repositroy.dart';

import '../../../../core/usecases/usecase.dart';

class CreateUserUseCase implements UseCase<void, AuthUser> {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  @override
  Future<void> call(AuthUser authUser) async {
    return await repository.createUser(authUser);
  }
}
