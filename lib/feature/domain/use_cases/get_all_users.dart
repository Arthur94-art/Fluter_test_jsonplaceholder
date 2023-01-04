import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder/core/error/failure.dart';
import 'package:jsonplaceholder/core/use_cases/use_cases.dart';
import 'package:jsonplaceholder/feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder/feature/domain/repository/user_repository.dart';

class GetAllUsers extends UseCase<List<UserEntity>> {
  final UserRepository userRepository;

  GetAllUsers(this.userRepository);
  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await userRepository.getAllUsers();
  }
}
