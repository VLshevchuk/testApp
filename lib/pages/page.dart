import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fathers/bloc/user_bloc.dart';
import 'package:mobile_fathers/cubit/internet_cubit.dart';
import 'package:mobile_fathers/service/user_repository.dart';
import 'package:mobile_fathers/widgets/action_butt.dart';
import 'package:mobile_fathers/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final userRepository2 = UserRepository();

  HomePage({super.key}); //переменная которая будет содержать репозитория
  @override
  Widget build(BuildContext context) {
    //BlocProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository2),
        ),
        BlocProvider(create: (context) => ConnCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ConnCubit, MyConnectionState>(
            builder: ((context, state) =>
                state.connected ? Text('В сети') : Text('Не в сети')),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(
              child: UserList(),
            ),
          ],
        ),
      ),
    );
  }
}
