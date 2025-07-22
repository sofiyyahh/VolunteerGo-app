import 'package:cloud_firestore/cloud_firestore.dart';
import '../all_entities/user_entity';

Future<void> addUserToFirestore(User user) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .add(user.toJson());
    print('✅ User added successfully!');
  } catch (e) {
    print('❌ Failed to add user: $e');
  }
}