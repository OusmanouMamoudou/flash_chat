import 'package:flash_chat/components/my_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// The code defines a WelcomeScreen widget that serves as the entry point of the application, providing options for login and registration.
// Le code définit un widget WelcomeScreen qui sert de point d'entrée de l'application, offrant des options de connexion et d'enregistrement.



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static String id = "welcome_screen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller with a duration of 1 second
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // Start the animation
    controller!.forward();
    // Create color animation from lightBlue to white
    animation = ColorTween(begin: Colors.lightBlue, end: Colors.white)
        .animate(controller!);

    // Listen for changes in the animation and rebuild the UI accordingly
    controller!.addListener(() {
      setState(() {});
    });
  }


// The dispose method disposes of the animation controller when the widget is no longer needed.
// La méthode dispose libère les ressources du contrôleur d'animation lorsque le widget n'est plus nécessaire.
  @override
  void dispose() {
    // Dispose of the animation controller to free up resources
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row containing the app logo and animated text
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'images/logo.png',
                    height: 60,
                  ),
                ),
                // Animated text 'Flash Chat'
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    speed: const Duration(milliseconds: 60),
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            // Custom button for navigating to the LoginScreen
            MyButton(
              color: Colors.lightBlueAccent,
              text: 'Connexion',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            // Custom button for navigating to the RegistrationScreen
            MyButton(
              color: Colors.blueAccent,
              text: "S'enrégister",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
