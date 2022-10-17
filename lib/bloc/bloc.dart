
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/repository.dart';
import 'bloc_events.dart';
import 'bloc_states.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()){
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      }catch(e){
        emit(UserErrorState(e.toString()));
      }

    });
  }
}