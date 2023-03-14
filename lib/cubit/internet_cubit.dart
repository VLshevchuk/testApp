import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionState {
  final bool connected;

  MyConnectionState(this.connected);
}

class ConnCubit extends Cubit<MyConnectionState>{
late  StreamSubscription<ConnectivityResult> _subscription;
  ConnCubit() : super(MyConnectionState(false)){
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      emit(MyConnectionState(event !=ConnectivityResult.none));
    });
  }
  @override 
  Future<void> close(){
    _subscription.cancel();
    return super.close();

  }
}