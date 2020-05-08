import 'package:local_auth/local_auth.dart';

class AuthController {
  final _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    if (await _isBiometricAvaiable()) {
      await _getListOfBiometricTypes();
      return _authenticateUser();
    }

    return false;
  }

  Future<bool> _isBiometricAvaiable() async {
    try {
      bool isAviable = await _auth.canCheckBiometrics;
      return isAviable;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future _getListOfBiometricTypes() async {
    try {
      await _auth.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _authenticateUser() async {
    try {
      bool isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: "Authentique-se para prosseguir", // msg
        useErrorDialogs: true, // exibir o erro na tela
        stickyAuth: true, // vai permanecer na tela até inserir
      );

      return isAuthenticated;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
