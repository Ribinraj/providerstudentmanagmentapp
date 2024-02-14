import 'package:studentprovider/data/database/db_helper.dart';
import 'package:studentprovider/data/database/utils.dart';
import 'package:studentprovider/data/model/student.dart';

class StudentRepository {
  DBHelper dbHelper = DBHelper();
  Future<List<StudentModel>> getData() async {
    var dbClient = await dbHelper.db;

    List<Map> maps = await dbClient.query(
      tableName,
      columns: [
        'id',
        'name',
        'gender',
        'phoneNumber',
        'profile',
        'rollNumber',
        'studentClass'
      ],
    );

    List<StudentModel> student = [];

    for (int i = 0; i < maps.length; i++) {
      student.add(StudentModel.fromMap(maps[i]));
    }

    return student;
  }

  Future<int> addData(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> updateData(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> deleteData(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
