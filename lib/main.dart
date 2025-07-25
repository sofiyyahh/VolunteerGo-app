import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:volunteergo/firebase/add_user.dart';
import 'package:volunteergo/firebase/attendance_record.dart';
import 'package:volunteergo/firebase/join_event';
import 'package:volunteergo/firebase/login_authentication';
 

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
  
   //this is the place that calls all functions once on app start
  @override
  void initState() {
    super.initState();
    addUser("Zriyab abubaker","zryba036@gmail.com", "the best password");
    joinEvent(29,31); 
    markUserAttendance(3, 2);
    loginUser("Zriyab abubaker", "the best password");
    
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User Test')),
      body: Center(child: Text('Check Firebase for the new user')),
    );
  }
}
