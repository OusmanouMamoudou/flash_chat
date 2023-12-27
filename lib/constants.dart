import 'package:flutter/material.dart';

// TextStyle for the send button text
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

// InputDecoration for the message text field
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Entrez votre Message...',
  border: InputBorder.none,
);

// BoxDecoration for the message container
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

// InputDecoration for generic input fields
const kInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

// Radius constants for circular shapes
const kCircularRadius = Radius.circular(30);

// BorderRadius constant for sender's message container
const kSenderBorderRadius = BorderRadius.only(
  topLeft: kCircularRadius,
  bottomLeft: kCircularRadius,
  bottomRight: kCircularRadius,
);

// BorderRadius constant for generic message container
const kBorderRadius = BorderRadius.only(
  topRight: kCircularRadius,
  bottomLeft: kCircularRadius,
  bottomRight: kCircularRadius,
);
