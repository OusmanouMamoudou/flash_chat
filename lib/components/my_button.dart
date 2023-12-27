import 'package:flutter/material.dart';

// The code defines a MyButton widget, which represents a stylized button with customizable color, text, and an onPressed callback.
// The widget takes parameters such as color, text, and onPressed to customize the appearance and behavior of the button.
// Le code définit un widget MyButton, qui représente un bouton stylisé avec une couleur, un texte et un rappel (callback) onPressed personnalisables.
// Le widget prend des paramètres tels que color, text et onPressed pour personnaliser l'apparence et le comportement du bouton.

// The button text is displayed with white color, and the button responds to user taps with the specified onPressed callback.
// Le texte du bouton est affiché en blanc, et le bouton réagit aux pressions de l'utilisateur avec le rappel onPressed spécifié.

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.text,
  });

  // Button color, text, and onPressed callback function
  final Color color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      // Material widget for button styling with elevation and rounded corners
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(30),
        // MaterialButton for user interaction
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          // Display button text with white color
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
