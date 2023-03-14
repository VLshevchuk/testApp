import 'package:mobile_fathers/model/user.dart';
import 'package:mobile_fathers/service/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>>getAllUsers() => _userProvider.getUsers();
}