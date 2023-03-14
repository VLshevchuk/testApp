import 'package:mobile_fathers/model/user.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';


class UserProvider {
  Future<List<User>> getUsers() async {
    //Возвр тип F в виде lista список польз и модель User
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    // реал get запроса,вызв метод get и передаем сылку при это ее прежде нужно parse
    if(response.statusCode == 200) {
      //возвр список пользователей
      final List<dynamic> userJson = json.decode(response.body);
      //decode расшифровать получить ответ
      return userJson.map((json) => User.fromJson(json)).toList();
      // превр в список
      //Что делает fromJson во флаттере?
      //Конструктор User.fromJson() для создания нового экземпляра User из структуры map
    } else {
      throw Exception('Error');
    }
  }
}