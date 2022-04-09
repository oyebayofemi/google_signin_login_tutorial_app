import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_tutorial_app/models/user_details.dart';

class AuthService {
  Userdetails? userdetails;
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    this.userdetails = new Userdetails(
        displayName: googleUser.displayName,
        email: googleUser.email,
        photourl: googleUser.photoUrl);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logout() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
  }
}
