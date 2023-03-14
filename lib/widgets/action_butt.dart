import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fathers/bloc/user_bloc.dart';
import 'package:mobile_fathers/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    //нужно получить доступ к блоку,делаеться через BProvider(через его метод of(context))
    //у метода of обяз должны передать блок в качестве дженерика
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          child: Text('Clear'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
        ),
      ],
    );
  }
}
