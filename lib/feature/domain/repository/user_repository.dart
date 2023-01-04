import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder/core/error/failure.dart';
import 'package:jsonplaceholder/feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
}
