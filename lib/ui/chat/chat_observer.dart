import 'dart:developer';

import 'package:bloc/bloc.dart';

class ChatBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("BLOC OBSERVER => ${bloc.runtimeType} $change");
  }
}
