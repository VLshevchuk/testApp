import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fathers/bloc/user_bloc.dart';
import 'package:mobile_fathers/bloc/user_state.dart';


class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    //для перестройки польз интерфейса исп W BlocBuilder
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data,please button',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
        return  ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.blueGrey[100] : Colors.blue[100],
              child: ListTile(
                leading: Text(
                  "id ${state.loadedUser[index].id}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      'My Name ${state.loadedUser[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'Email: ${state.loadedUser[index].email}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone ${state.loadedUser[index].phone}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return Center(
            child: Text(
              'Error feathing',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
