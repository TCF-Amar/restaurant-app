class LoginBlocState {}

class LoginInitialState extends LoginBlocState {
  
}

class LoginLoadingState extends LoginBlocState {}

class LoginSuccessState extends LoginBlocState {}

class LoginErrorState extends LoginBlocState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LoginValidationErrorState extends LoginBlocState {
  final String emailError;
  final String passwordError;

  LoginValidationErrorState({this.emailError = '', this.passwordError = ''});
}

class LoginEmptyFieldsState extends LoginBlocState {}
