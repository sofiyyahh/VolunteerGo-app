class Attendance {
  final int AttendanceId;
  final int RegistrationId;
  final DateTime CheckInTime;


  Attendance({
    required this.AttendanceId,
    required this.RegistrationId,
    required this.CheckInTime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      AttendanceId: json['AttendanceId'],
      RegistrationId: json['RegistrationId'],
      CheckInTime: DateTime.parse(json['CheckInTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AttendanceId': AttendanceId,
      'RegistrationId': RegistrationId,
      'CheckInTime': CheckInTime.toIso8601String(),
    };
  }
}