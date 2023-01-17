import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/feature/domain/use_cases/get_all_users.dart';
import 'package:jsonplaceholder/feature/presentation/cubit/users_list_state.dart';

class UsersListCubit extends Cubit<UsersState> {
  final GetAllUsers getAllUsers;
  UsersListCubit({required this.getAllUsers}) : super(UsersEmpty());

  void loadingUsers() {
    if (state is UsersLoading) return;
    if (state is UsersLoaded) {}
  }
}
