import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/custom_error.dart';
import '/repository/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;
  SignupCubit({required this.authRepository}) : super(SignupState.initial());

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWith(signupStatus: SignupStatus.submitting));

    try {
      await authRepository.signup(
        email: email,
        password: password,
        name: name,
      );
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signupStatus: SignupStatus.error,
          error: e,
        ),
      );
    }
  }
}
