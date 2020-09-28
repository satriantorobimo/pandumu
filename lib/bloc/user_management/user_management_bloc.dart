import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pandumu/bloc/user_management/user_management.dart';
import 'package:pandumu/repository/user_repo/user_repo.dart';

class UserManagementBloc
    extends Bloc<UserManagementEvent, UserManagementState> {
  UserManagementBloc({@required this.usersRepository})
      : assert(usersRepository != null);
  final UserRepository usersRepository;
  StreamSubscription _usersSubscription;

  @override
  Stream<UserManagementState> mapEventToState(
      UserManagementEvent event) async* {
    if (event is LoadUser) {
      yield* _mapLoadTodosToState();
    } else if (event is AddUser) {
      yield* _mapAddTodoToState(event);
    } else if (event is UpdateUser) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteUser) {
      yield* _mapDeleteTodoToState(event);
    } else if (event is UserUpdated) {
      yield* _mapTodosUpdateToState(event);
    }
  }

  Stream<UserManagementState> _mapLoadTodosToState() async* {
    _usersSubscription?.cancel();
    _usersSubscription = usersRepository.users().listen(
          (users) => add(UserUpdated(users)),
        );
  }

  Stream<UserManagementState> _mapAddTodoToState(AddUser event) async* {
    usersRepository.addNewUser(event.user);
  }

  Stream<UserManagementState> _mapUpdateTodoToState(UpdateUser event) async* {
    usersRepository.updateUser(event.user);
  }

  Stream<UserManagementState> _mapDeleteTodoToState(DeleteUser event) async* {
    usersRepository.deleteUser(event.user);
  }

  Stream<UserManagementState> _mapTodosUpdateToState(UserUpdated event) async* {
    yield UserLoaded(event.user);
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    return super.close();
  }

  @override
  UserManagementState get initialState => UserEmpty();
}
