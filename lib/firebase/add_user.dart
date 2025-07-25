import 'package:cloud_firestore/cloud_firestore.dart';
import '../all_entities/user_entity';


//function to call to add a user into the database
Future<void> addUser(String currentFullName,String currentEmail, String currentPassword ) async {
  try {
    int newId = await getNextUserId();
    final newuser =User(
      userId: newId,
      fullName: currentFullName,
      email: currentEmail,
      password: currentPassword
      );

    await FirebaseFirestore.instance
        .collection('User')
        .add(newuser.toJson());
    print('User added successfully!');
  } catch (e) {
    print('Failed to add user: $e');
  }
}

//function to give new users their special ID
Future<int> getNextUserId() async {
  final counterRef = FirebaseFirestore.instance.collection('Counters').doc('userId');
  final snapshot = await counterRef.get();

  int currentId = snapshot.exists ? snapshot.get('currentId') : 0;
  int nextId = currentId + 1;

  // update the counter
  await counterRef.set({'currentId': nextId});

  return nextId;
}