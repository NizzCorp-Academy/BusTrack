import 'package:bus_booking_app/domain/repositories/auth_repository.dart';

class LoginUseCase extends AuthRepository {
  LoginUseCase();

  Future<bool> call(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    const validEmail = 'rasim@gmail.com';
    const validPassword = 'RASIM@123';

    if (email.trim() == validEmail && password.trim() == validPassword) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> login(String email, String password) {
    throw UnimplementedError();
  }
}
