import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthProvider with ChangeNotifier {
  var myemail,mypassword,myname;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
 // firebase_storage.Reference ref =
 // firebase_storage.FirebaseStorage.instance.ref('/images');
  UserCredential? userCredential;
 /* UserModel userModel = UserModel();

  XFile? image;
  ImagePicker imagePicker = ImagePicker();
*/
  register(String email, String password, String name) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // userModel.id = userCredential!.user!.uid;
      // userModel.name = name;
      // userModel.email = email;
      return userCredential;
     // print(userCredential!.user!.uid);
      // await takeImage();
      // await addUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  SignIn(String email, String password) async {
    try {
       userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:email,
          password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    print(userCredential!.user!.uid);
    print(userCredential!.user!.emailVerified);
    if (userCredential!.user!.emailVerified == false) {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
    signInAnonymously() async {
      userCredential = await FirebaseAuth.instance.signInAnonymously();
      print(userCredential!.user!.uid);
    }
    /*
  takeImage() async {
    image = await imagePicker.pickImage(source: ImageSource.camera);
    await ref.child('${userCredential!.user!.uid}.jpg').putFile(File(image!.path));
    String downloadURL = await ref.child("${userCredential!.user!.uid}.jpg")
        .getDownloadURL();
    userModel.photoUrl = downloadURL;
    print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyh");
    print(downloadURL);
  }
 addUser() async {
    Todos todos = Todos(title: "Task1",done: false);
    userModel.todos = [];
    userModel.todos!.add(todos);
    firebaseDatabase.reference().child(userCredential!.user!.uid).set(
        userModel.toJson()
    );
  }
  */

  }
