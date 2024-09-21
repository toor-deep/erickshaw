import 'package:erickshawapp/features/auth/data/data_source/auth_data_source.dart';
import 'package:erickshawapp/features/auth/domain/repository_impl/auth_repository_impl.dart';
import 'package:erickshawapp/features/auth/domain/usecase/change_password.usecase.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in.usecase.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in_with_google.usecase.dart';

import 'package:erickshawapp/features/auth/domain/usecase/sign_out.usecase.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:erickshawapp/features/current_user/domain/repository_impl/user_repository_iimpl.dart';
import 'package:erickshawapp/features/current_user/domain/usecase/get_user_info.usecase.dart';
import 'package:erickshawapp/features/current_user/presentation/bloc/user_cubit.dart';
import 'package:erickshawapp/features/rides/domain/usecase/get_pre_book_rides_list.usecase.dart';
import 'package:erickshawapp/features/rides/domain/usecase/pre_book_ride.usecase.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/usecase/delete_account.usecase.dart';
import '../../features/auth/domain/usecase/sign_up.usecase.dart';
import '../../features/auth/presentation/bloc/sign_up/sign_up_cubit.dart';
import '../../features/current_user/domain/usecase/create_user.usecase.dart';
import '../../features/current_user/domain/usecase/delete_user.usecase.dart';
import '../../features/current_user/domain/usecase/update_user.usecase.dart';
import '../../features/rides/data/data_source/ride_request_data_source.dart';
import '../../features/rides/domain/respository_impl/requested_ride_repository_impl.dart';
import '../../features/rides/domain/usecase/cancel_ride.usecase.dart';
import '../../features/rides/domain/usecase/get_all_rides.usecase.dart';
import '../../features/rides/domain/usecase/get_requested_ride_details.usecase.dart';
import '../../features/rides/domain/usecase/send_request.usecase.dart';
import '../../features/rides/presentation/bloc/ride_cubit.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  //Authentication Process
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
      ChangePasswordUseCase(repository: getIt<AuthRepositoryImpl>()));
  getIt.registerSingleton(
      DeleteAccountUseCase(repository: getIt<AuthRepositoryImpl>()));
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
      changePasswordUseCase: getIt<ChangePasswordUseCase>(),
      deleteAccountUseCase: getIt<DeleteAccountUseCase>()));
  getIt.registerSingleton(UserCubit(
    getUserUseCase: getIt<GetUserUseCase>(),
    createUserUseCase: getIt<CreateUserUseCase>(),
    updateUserUseCase: getIt<UpdateUserUseCase>(),
    deleteUserUseCase: getIt<DeleteUserUseCase>(),
  ));

  ///--------------------------------------Ride injections------------------
  //dataSource
  getIt.registerSingleton(RideRequestDataSourceImpl());
  //repository_impl
  getIt.registerSingleton(RideRequestRepositoryImpl(
      dataSource: getIt<RideRequestDataSourceImpl>()));
  //usecases
  getIt.registerSingleton(
      SendRideRequestUseCase(getIt<RideRequestRepositoryImpl>()));
  getIt.registerSingleton(
      CancelRideRequestUseCase(getIt<RideRequestRepositoryImpl>()));
  getIt.registerSingleton(
      GetRideRequestDetailsUseCase(getIt<RideRequestRepositoryImpl>()));
  getIt.registerSingleton(
      GetAllRideRequestsForUserUseCase(getIt<RideRequestRepositoryImpl>()));
  getIt.registerSingleton(
      SendPreBookRideRequestUseCase(getIt<RideRequestRepositoryImpl>()));
  getIt.registerSingleton(GetAllPreBookRideRequestsForUserUseCase(
      getIt<RideRequestRepositoryImpl>()));
  //cubit
  getIt.registerSingleton(RideCubit(
      sendRideRequestUseCase: getIt<SendRideRequestUseCase>(),
      getRideRequestDetailsUseCase: getIt<GetRideRequestDetailsUseCase>(),
      cancelRideRequestUseCase: getIt<CancelRideRequestUseCase>(),
      sendPreBookRideRequestUseCase: getIt<SendPreBookRideRequestUseCase>(),
      getAllPreBookRideRequestsForUserUseCase:
          getIt<GetAllPreBookRideRequestsForUserUseCase>(),
      getAllRideRequestsForUserUseCase:
          getIt<GetAllRideRequestsForUserUseCase>()));
}
