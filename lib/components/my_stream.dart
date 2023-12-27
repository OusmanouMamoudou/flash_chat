import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_widget.dart';
import 'package:flutter/material.dart';

// The code defines a MyStreamWidget that represents a stream of messages from the Firestore database.
// Le code définit un widget MyStreamWidget qui représente un flux de messages depuis la base de données Firestore.
// The widget takes parameters such as firestore for accessing Firestore and loggedUser representing the currently logged-in user.
// Le widget prend des paramètres tels que firestore pour accéder à Firestore et loggedUser représentant l'utilisateur actuellement connecté.

// For each received message, it creates a MessageWidget and adds it to the list of messageWidgets.
// Pour chaque message reçu, il crée un MessageWidget et l'ajoute à la liste messageWidgets.
// Finally, it displays the list of MessageWidgets in a reversed ListView.
// Enfin, il affiche la liste des MessageWidgets dans un ListView inversé

class MyStreamWidget extends StatelessWidget {
  const MyStreamWidget({
    super.key,
    required this.firestore,
    required this.loggedUser,
  });

  // Firestore instance for accessing the database
  final FirebaseFirestore firestore;
  // Currently logged-in user
  final User loggedUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        // Create a stream from the 'messages' collection, ordered by 'message' field
        stream: firestore.collection('messages').orderBy('message').snapshots(),
        builder: (context, snapshot) {
          // Check if data is not yet available
          if (!snapshot.hasData) {
            return const Center(
              // Display a loading indicator while data is loading
              child: CircularProgressIndicator(
                color: Colors.lightBlueAccent,
              ),
            );
          }
          // List to store MessageWidgets representing chat messages
          final List<MessageWidget> messageWidgets = [];
          // Reverse the order of messages for proper display
          final messages = snapshot.data!.docs.reversed;

          // Iterate through each message and create MessageWidget
          for (var message in messages) {
            // Extract message data from Firestore document
            final Map<String, dynamic> data =
                message.data()! as Map<String, dynamic>;
            final messageText = data['message'];
            final senderText = data['sender'];
            final currentUser = loggedUser.email;
            // Add MessageWidget to the list based on whether the current user sent the message
            messageWidgets.add(MessageWidget(
              isTheLoggedUser: currentUser == senderText,
              messageText: messageText,
              senderText: senderText,
            ));
          }
          // Display the list of MessageWidgets in a reversed ListView
          return Expanded(
              child: ListView(
                  reverse: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  children: messageWidgets));
        });
  }
}
