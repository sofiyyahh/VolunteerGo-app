import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volunteergo/firebase/add_user.dart';
import 'package:volunteergo/all_entities/user_entity'; // make sure this is correct



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddUserTestScreen(),
    );
  }
}

class AddUserTestScreen extends StatefulWidget {
  @override
  _AddUserTestScreenState createState() => _AddUserTestScreenState();
}

class _AddUserTestScreenState extends State<AddUserTestScreen> {
  @override
  void initState() {
    super.initState();
    testAddUser(); // call your test function once on app start
  }

  void testAddUser() {
    final newUser = User(
      fullName: 'Jackson Farm',
      email: 'jackson@example.com',
      password: 'superSecurePassword123',
    );

    addUserToFirestore(newUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User Test')),
      body: Center(child: Text('Check Firebase for the new user')),
    );
  }
}
