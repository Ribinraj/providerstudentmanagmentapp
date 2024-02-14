class StudentModel {
  int? id;
  String? name;

  String? gender;
  String? phoneNumber;

  String? profile;

  String? rollNumber;
  String? studentClass;

  StudentModel({
    this.id,
    this.name,
    this.gender,
    this.phoneNumber,
    this.profile,
    this.rollNumber,
    this.studentClass,
  });

  factory StudentModel.fromMap(Map<dynamic, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      profile: json['profile'],
      rollNumber: json['rollNumber'],
      studentClass: json['studentClass'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'profile': profile,
      'rollNumber': rollNumber,
      'studentClass': studentClass,
    };
  }
}
