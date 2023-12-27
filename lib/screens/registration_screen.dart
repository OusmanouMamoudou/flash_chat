import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// The code defines a RegistrationScreen widget that allows users to register by providing an email
// and password with Firebase authentication.
// Le code définit un widget RegistrationScreen qui permet aux utilisateurs
// de s'enregistrer en fournissant une adresse e-mail et un mot de passe avec
// l'authentification Firebase.

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Firebase authentication instance
  final _auth = FirebaseAuth.instance;

  // Variables to store email, password, and loading state
  String? email;
  String? password;
  bool isLoading = false, isShorter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        color: Colors.blueAccent,
        // Loading indicator
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blueAccent,
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
                  child: Image.asset('images/logo.png', height: 200)),
              const SizedBox(
                height: 48.0,
              ),
              // Input field for email
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.blueAccent,
                textAlign: TextAlign.center,
                decoration: kInputDecoration.copyWith(
                  hintText: 'Entre votre email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              // Input field for password
              TextField(
                  onChanged: (value) {
                    password = value;
                    setState(() {
                      // Check if the password is less than 6 characters
                      if (password!.isNotEmpty && password!.length < 6) {
                        isShorter = true;
                      } else {
                        isShorter = false;
                      }
                    });
                  },
                  cursorColor: Colors.blueAccent,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  // Custom decoration with dynamic border color based on password length
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Entrer votre mot de passe',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(
                        color: isShorter ? Colors.red : Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              // Error message for short passwords
              if (isShorter)
                const Center(
                  child: Text('Veuillez saisir un mot de passe supérieur à 5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      )),
                ),
              const SizedBox(
                height: 24.0,
              ),
              // Registration button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        // Create a new user account with email and password
                        await _auth.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        // Navigate to the ChatScreen after successful registration
                        if (!context.mounted) return;
                        Navigator.pushNamed(context, ChatScreen.id);
                      } catch (e) {
                        print("e :$e");
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      "S'enrégistrer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
