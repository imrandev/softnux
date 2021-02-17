import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:softnux/utills/prefs_util.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc() : super(AuthenticationLoading());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    try {
      if (event is PasswordVisibilityEvent) {
        yield PasswordVisibilityState(event.visibility, event.password);
      } else if (event is CheckAuthStatus) {
        if (await PrefsUtil().isLoggedIn()) {
          yield AuthenticationInitialized();
        } else {
          yield AuthenticationUninitialized();
        }
      } else if (event is GoogleSignInEvent) {
        UserCredential userCredential =  await signInWithGoogle();
        if (userCredential != null) {
          User user = userCredential.user;
          PrefsUtil().saveUserEmail(user.email);
          PrefsUtil().saveUsername(user.displayName);
          PrefsUtil().saveSession(true);
          yield GoogleSignInInitialized();
        }
      }
    } on Error {

    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
