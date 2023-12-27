import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//English
// The code imports necessary packages and screens for the app, initializes Firebase, and defines the main app structure.
// The main function ensures Flutter is initialized, initializes Firebase, and runs the app.
//The MyApp class is the main application widget, defining the theme and routes.
//Add your Firebase Options using flutterFire usng :flutterfire configure

//French
// Le code importe les packages et les écrans nécessaires pour l'application, initialise Firebase et définit la structure principale de l'application.
// La fonction main s'assure que Flutter est initialisé, initialise Firebase et lance l'application.
// La classe MyApp est le widget principal de l'application, définissant le thème et les itinéraires.
//Veuillez ajouter vos options Firebase en utilisant :flutterfire configure

void main() async {
  // Ensure that Flutter is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the provided options
  //Remove this Comments after adding your firebase options
  //Enlever ce commentaire aprés avoir ajouter vos options Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme for the entire app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set the initial route and define named routes
      initialRoute: WelcomeScreen.id,
      // Define named routes for navigation within the app
      routes: {
        // WelcomeScreen route mapped to its corresponding screen widget
        WelcomeScreen.id: (context) => const WelcomeScreen(),

        // ChatScreen route mapped to its corresponding screen widget
        ChatScreen.id: (context) => const ChatScreen(),

        // LoginScreen route mapped to its corresponding screen widget
        LoginScreen.id: (context) => const LoginScreen(),

        // RegistrationScreen route mapped to its corresponding screen widget
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
    );
  }
}
