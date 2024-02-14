import 'package:flutter/material.dart';

import 'package:studentprovider/data/model/student.dart';
import 'package:studentprovider/data/repository/student_repository.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> allStudent = [];

  StudentRepository studentRepository = StudentRepository();

  Future<void> fetchAllStudent() async {
    try {
      var studentList = await studentRepository.getData();
      allStudent = studentList;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint("Error fetching all students: $e");
    }
  }

  addStudent(StudentModel studentModel) {
    studentRepository.addData(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.updateData(studentModel);
    fetchAllStudent();
  }

  deleteStudent(int id) {
    studentRepository.deleteData(id);
    fetchAllStudent();
  }
}
