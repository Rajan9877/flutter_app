class StudentModel {
  final String status, msg;
  final List<Students> students;

  StudentModel({
    required this.status,
    required this.students,
    required this.msg,
  });

  factory StudentModel.fromJson(Map<String, dynamic> parsedJson) {
    var data;
    if (parsedJson['status'] == "success") {
      var list = parsedJson['students'] as List;
      List<Students> uList =
      list.map((i) => Students.fromJson(i)).toList();
      data = StudentModel(
        status: parsedJson['status'],
        students: uList,
        msg: '',
      );
    } else {
      data = StudentModel(
        status: parsedJson['status'],
        msg: parsedJson['msg'],
        students: [],
      );
    }
    return data;
  }
}

class Students {
  final String name, rollno, student_class;
  Students({
    required this.name,
    required this.rollno,
    required this.student_class,
  });

  factory Students.fromJson(Map<String, dynamic> parsedJson) {
    return Students(
      name: parsedJson['name'],
      rollno: parsedJson['rollno'],
      student_class: parsedJson['student_class']
    );
  }
}


