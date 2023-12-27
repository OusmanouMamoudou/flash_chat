import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

// The code defines a MessageWidget that represents a message in the chat,
//displaying the sender's name and the message text with appropriate styling.
// Le code définit un widget MessageWidget qui représente un message dans la discussion,
// affichant le nom de l'expéditeur et le texte du message avec le style approprié.
// The widget takes parameters such as messageText, senderText, and isTheLoggedUser
// to customize the appearance based on the sender and whether the logged user sent
// the message.
// Le widget prend des paramètres tels que messageText, senderText et isTheLoggedUser
// pour personnaliser l'apparence en fonction de l'expéditeur et de savoir
// si l'utilisateur connecté a envoyé le message.

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.messageText,
    required this.senderText,
    required this.isTheLoggedUser,
  });

  // Message text, sender text, and a flag indicating if the logged user sent the message
  final String messageText, senderText;
  final bool isTheLoggedUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        // Align the message based on whether the logged user sent it or not
        crossAxisAlignment:
            isTheLoggedUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Display sender's name
          Text(
            senderText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
          // Display the message with appropriate styling and background color
          Material(
            color: isTheLoggedUser ? Colors.lightBlueAccent : Colors.white,
            borderRadius: isTheLoggedUser ? kSenderBorderRadius : kBorderRadius,
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // Display the message text
              child: Text(
                messageText,
                style: TextStyle(
                    color: isTheLoggedUser ? Colors.white : Colors.black,
                    fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
