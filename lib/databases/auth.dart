import 'package:firebase_auth/firebase_auth.dart';

/// This is where we define methods to interact with firebase auth for us ///
class AuthService {
  var userName;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase user one-time fetch
  User get getUser => _auth.currentUser;
  // auth change user stream. when everthe user signs in or out we get respose
  // down the stream. "null" for signed out. user object mapped on sign in.
  Stream<User> get user => _auth.authStateChanges();
  Stream<User> get tokenChanges => _auth.idTokenChanges();

  // sign in anonymously
  Future<User> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return (user);
    } catch (e) {
      print("ERROR " + e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("ERROR" + e.toString());
      return null;
    }
  }

  // sign in with mail
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Update user data
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with mail
  Future<User> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Update user data
      await result.user.updateProfile(displayName: name);
      userName = name;

      return result.user;
    } catch (e) {
      print("ERROR " + e.toString());
      return null;
    }
  }

  /// Sign in with Google
  // Future<User> googleSignIn() async {
  //   try {
  //     GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
  //     GoogleSignInAuthentication googleAuth =
  //         await googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     UserCredential result = await _auth.signInWithCredential(credential);
  //     print(result);
  //     // Update user data
  //     // await updateUserData(result.user);
  //     return result.user;
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }
}
