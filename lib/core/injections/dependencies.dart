import 'package:erickshawapp/features/auth/data/data_source/auth_data_source.dart';
import 'package:erickshawapp/features/auth/domain/repository_impl/auth_repository_impl.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in.usecase.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in_with_google.usecase.dart';

import 'package:erickshawapp/features/auth/domain/usecase/sign_out.usecase.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/usecase/sign_up.usecase.dart';
import '../../features/auth/presentation/bloc/sign_up/sign_up_cubit.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  // Data Sources
  getIt.registerSingleton(AuthRemoteDataSourceFirebase());

  // Repositories
  getIt.registerSingleton(AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSourceFirebase>()));

  // Use Cases
   getIt.registerSingleton(SignInUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(SignUpUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(SignInWithGoogleUseCase(authRepository: getIt<AuthRepositoryImpl>()));
  // blocs
  getIt.registerSingleton<SignInCubit>(
      SignInCubit(signInUseCase: getIt<SignInUseCase>(),signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>()));
  getIt.registerSingleton<SignUpCubit>(
      SignUpCubit(signUpUseCase: getIt<SignUpUseCase>()));
}
