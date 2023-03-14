import 'package:mobile_fathers/model/user.dart';

abstract class UserState{}
class UserEmptyState extends UserState{}//польз нету
class UserLoadingState extends UserState{}//состояние загрузки
class UserLoadedState extends UserState{//данные успешно загруженны
  //созд переменную что бы в нее передать загр пользователей
  List<User> loadedUser;
  UserLoadedState({
    required this.loadedUser,
  });
}

class UserErrorState extends UserState{}