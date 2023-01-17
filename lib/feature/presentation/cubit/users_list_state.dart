import 'package:equatable/equatable.dart';

import 'package:jsonplaceholder/feature/domain/entities/user_entity.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersEmpty extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoading extends UsersState {
  final List<UserEntity> oldUsersList;

  const UsersLoading(this.oldUsersList);
  @override
  List<Object> get props => [oldUsersList];
}

class UsersLoaded extends UsersState {
  final List<UserEntity> usersList;

  const UsersLoaded(this.usersList);
  @override
  List<Object> get props => [usersList];
}

class UsersError extends UsersState {
  final String message;

  const UsersError({required this.message});
  @override
  List<Object> get props => [message];
}
