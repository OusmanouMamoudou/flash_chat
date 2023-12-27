import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/my_stream.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String id = "chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User? loggedUser;
  String? message;
  final messageEditingController = TextEditingController();

  // La méthode getCurrentUser récupère l'utilisateur actuellement
  // connecté en utilisant l'authentification Firebase.
  //The getCurrentUser method retrieves the currently logged-in user
  // using Firebase authentication.
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // The initState method is called when the stateful widget is inserted into the tree,
    // and it calls getCurrentUser to initialize the loggedUser variable.
    // La méthode initState est appelée lorsque le widget étatique est inséré dans l'arbre,
    // et elle appelle getCurrentUser pour initialiser la variable loggedUser.
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          // Logout button in the app bar
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Widget to display the chat messages stream
            MyStreamWidget(
              firestore: _firestore,
              loggedUser: loggedUser!,
            ),
            // Input field for typing and sending messages
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageEditingController,
                      cursorColor: Colors.lightBlue,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  // Send button to send messages
                  TextButton(
                      onPressed: () {
                        if (message != null) {
                          messageEditingController.clear();
                          // Add the message to the Firestore collection
                          _firestore.collection('messages').add({
                            'sender': loggedUser!.email,
                            'message': message,
                          });
                          message = null;
                        }
                      },
                      child: const Icon(Icons.send,
                          size: 35, color: Colors.lightBlue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
