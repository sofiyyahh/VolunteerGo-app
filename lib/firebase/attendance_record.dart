import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> markUserAttendance(int userId, int eventId) async {
  try {
    int newId = await getNextAttendanceId();
    final attendanceQuery = await FirebaseFirestore.instance
        .collection('Registration')
        .where('userId', isEqualTo: userId)
        .where('eventId', isEqualTo: eventId)
        .get();

    if (attendanceQuery.docs.isEmpty) {
      print('No registration found for user $userId and event $eventId');
      return;
    }

    final registrationDoc = attendanceQuery.docs.first;
    final registrationId = registrationDoc.data()['registrationId'];

    final attendanceRef = FirebaseFirestore.instance.collection('attendance');

    final newAttendance = {
      'attendanceId' :newId,
      'registrationId': registrationId,
      'checkInTime': Timestamp.now(),
    };

    await attendanceRef.add(newAttendance);

    print('Attendance recorded successfully.');
  } catch (e) {
    print('Error recording attendance: $e');
  }
}



Future<int> getNextAttendanceId() async {
  final counterRef = FirebaseFirestore.instance.collection('Counters').doc('AttendanceId');
  final snapshot = await counterRef.get();

  int currentId = snapshot.exists ? snapshot.get('currentId') : 0;
  int nextId = currentId + 1;

  // update the counter
  await counterRef.set({'currentId': nextId});

  return nextId;
}