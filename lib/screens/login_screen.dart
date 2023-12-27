import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/my_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// The code defines a LoginScreen widget that allows users to log in
// using email and password with Firebase authentication.
// Le code définit un widget LoginScreen qui permet aux utilisateurs
// de se connecter en utilisant l'adresse e-mail et le mot de passe
// avec l'authentification Firebase.

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Firebase authentication instance
  final _auth = FirebaseAuth.instance;

  // Variables to store email, password, and loading state
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        color: Colors.lightBlueAccent,
        // Loading indicator
        progressIndicator: const CircularProgressIndicator(
          color: Colors.lightBlueAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App logo
              Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'images/logo.png',
                    height: 200.0,
                  )),
              const SizedBox(
                height: 48.0,
              ),
              // Input field for email
              TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  cursorColor: Colors.blueAccent,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your email',
                  )),
              const SizedBox(
                height: 8.0,
              ),
              // Input field for password
              TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  cursorColor: Colors.blueAccent,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Entrez votre mot de passe',
                  )),
              const SizedBox(
                height: 24.0,
              ),
              // Custom button for login
              MyButton(
                color: Colors.lightBlueAccent,
                text: 'Connexion',
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    // Sign in with email and password
                    await _auth.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    // Navigate to the ChatScreen after successful login
                    if (!context.mounted) return;
                    Navigator.pushNamed(context, ChatScreen.id);
                  } on Exception catch (e) {
                    print(e);
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
