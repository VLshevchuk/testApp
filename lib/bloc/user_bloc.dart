import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fathers/bloc/user_event.dart';
import 'package:mobile_fathers/bloc/user_state.dart';
import 'package:mobile_fathers/model/user.dart';
import 'package:mobile_fathers/service/user_repository.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) :super(UserEmptyState()){
    //зарегистр 2 события
    on<UserLoadEvent>((event, emit)  async{
      //при нажатии на кнопку надо  сгенерирывть состояние загрузки
      emit(UserLoadingState());
      //
    try {
      //для начало нужно вытянуть польз из репозитория
    final List<User>loadedUserList = await userRepository.getAllUsers();
    //польз передали в переменную 
    //c помощью emit генерируем состояние успешности загрузки пользователей
    emit(UserLoadedState(loadedUser:loadedUserList)); 
    } catch(_){
      emit(UserErrorState());
    }
    });
    on<UserClearEvent>((event, emit) async{
      //перед пустое состояние
      emit(UserEmptyState());
    });
  }
}