import 'package:jsonplaceholder/core/error/exeption.dart';
import 'package:jsonplaceholder/core/platform/network_info.dart';
import 'package:jsonplaceholder/feature/data/src/user_local_data.dart';
import 'package:jsonplaceholder/feature/data/src/user_remote_data.dart';
import 'package:jsonplaceholder/feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder/feature/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteData userRemoteData;
  final UserLocalData userLocalData;
  final NetWorkInfo netWorkInfo;

  UserRepositoryImpl(
      {required this.userRemoteData,
      required this.userLocalData,
      required this.netWorkInfo});

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteUsers = await userRemoteData.getAllUsers();
        userLocalData.setUsersToCache(remoteUsers);
        return Right(remoteUsers);
      } on ServerExeption {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUsers = await userLocalData.getListUsersFromCache();
        return Right(localUsers);
      } on CacheExeption {
        return Left(CacheFailure());
      }
    }
  }
}
