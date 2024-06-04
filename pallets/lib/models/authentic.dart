import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthException implements Exception{
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen(
      (User? user) {
        usuario = (user == null) ? null : user;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String senha) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    }on FirebaseAuthException catch(e){
      print(e.code);
      if(e.code == 'invalid-credential'){
        throw AuthException('Senha ou Email errados');
      }else{
        throw AuthException('Tente novamnete');
      }
    }
  }

  login(String email, String senha) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    }on FirebaseAuthException catch(e){
      print(e.code);
      if(e.code == 'invalid-credential'){
        throw AuthException('Senha ou Email errada');
      }else{
        throw AuthException('Tente novamnete');
      }
    }
  }

  logout() async{
    await _auth.signOut();
    _getUser();
  }

}
