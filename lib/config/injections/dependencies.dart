import 'package:erickshawapp/features/auth/data/data_source/auth_data_source.dart';
import 'package:erickshawapp/features/auth/domain/repository_impl/auth_repository_impl.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in.usecase.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in_with_google.usecase.dart';

import 'package:erickshawapp/features/auth/domain/usecase/sign_out.usecase.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:erickshawapp/features/current_user/domain/repository_impl/user_repository_iimpl.dart';
import 'package:erickshawapp/features/current_user/domain/usecase/get_user_info.usecase.dart';
import 'package:erickshawapp/features/current_user/presentation/bloc/user_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/usecase/sign_up.usecase.dart';
import '../../features/auth/presentation/bloc/sign_up/sign_up_cubit.dart';
import '../../features/current_user/domain/usecase/create_user.usecase.dart';
import '../../features/current_user/domain/usecase/delete_user.usecase.dart';
import '../../features/current_user/domain/usecase/update_user.usecase.dart';
import '../../shared/state/app-theme/app_theme_cubit.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  // Data Sources
  getIt.registerSingleton(AuthRemoteDataSourceFirebase());

  // Repositories
  getIt.registerSingleton(AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSourceFirebase>()));
  getIt.registerSingleton(UserRepositoryImpl());

  // Use Cases
  getIt.registerSingleton(
      SignInUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(
      SignUpUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(
      SignInWithGoogleUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(
      SignOutUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(
      GetUserUseCase(repository: getIt<UserRepositoryImpl>()));
  getIt.registerSingleton(UpdateUserUseCase(getIt<UserRepositoryImpl>()));
  getIt.registerSingleton(CreateUserUseCase(getIt<UserRepositoryImpl>()));
  getIt.registerSingleton(DeleteUserUseCase(getIt<UserRepositoryImpl>()));

  // blocs
  getIt.registerSingleton(SignInCubit());
  getIt.registerSingleton(SignUpCubit());
  getIt.registerSingleton(AuthCubit(
    signInUseCase: getIt<SignInUseCase>(),
    signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
    signOutUseCase: getIt<SignOutUseCase>(),
    signUpUseCase: getIt<SignUpUseCase>(),
  ));
  getIt.registerSingleton(UserCubit(
    getUserUseCase: getIt<GetUserUseCase>(),
    createUserUseCase: getIt<CreateUserUseCase>(),
    updateUserUseCase: getIt<UpdateUserUseCase>(),
    deleteUserUseCase: getIt<DeleteUserUseCase>(),
  ));
}
