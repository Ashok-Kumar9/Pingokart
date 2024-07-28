import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get isLoggedIn => _user != null;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> loadCurrentUser() async {
    try {
      _user = _auth.currentUser;
      notifyListeners();
    } catch (e) {
      setErrorMessage(e.toString());
    }
  }

  Future<void> registerWithEmailAndPassword(
      String name, String email, String password) async {
    setLoading(true);
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.updateDisplayName(name);
      setUser(userCredential.user);

      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      setErrorMessage(e.message);
    } finally {
      setLoading(false);
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    setLoading(true);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      setUser(userCredential.user);
    } on FirebaseAuthException catch (e) {
      setErrorMessage(e.message);
    } finally {
      setLoading(false);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setUser(null);
  }
}
