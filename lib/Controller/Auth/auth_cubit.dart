import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static get(context) => BlocProvider.of<AuthCubit>(context);

  bool isPasswordShown = false;

  void changeVisibilityPass() {
    isPasswordShown = !isPasswordShown;
    emit(ChangeVisibilityPassword());
  }
}
