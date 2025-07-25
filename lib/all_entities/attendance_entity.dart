class Attendance {
  final int attendanceId;
  final int registrationId;
  final DateTime checkInTime;


  Attendance({
    required this.attendanceId,
    required this.registrationId,
    required this.checkInTime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      attendanceId: json['attendanceId'],
      registrationId: json['registrationId'],
      checkInTime: DateTime.parse(json['checkInTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'attendanceId': attendanceId,
      'registrationId': registrationId,
      'checkInTime': checkInTime.toIso8601String(),
    };
  }
}