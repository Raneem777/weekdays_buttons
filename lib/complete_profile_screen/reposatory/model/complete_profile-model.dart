
class DoctorProfileMetadata {
  final String firstName;
  final String lastName;


  DoctorProfileMetadata({
    required this.firstName,
    required this.lastName,

  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,

    };
  }
}