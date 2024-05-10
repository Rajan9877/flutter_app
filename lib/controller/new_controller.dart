import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:new_flutter_app/model/student_model.dart';
import 'package:new_flutter_app/repo/common_repo.dart';
import 'package:new_flutter_app/repo/student_repo.dart';
import 'package:new_flutter_app/service/api_service.dart';
import '../repo/user_repo.dart';

class NewController extends GetxController{

  String buttonName = 'Add';
  int number = 0;

  String name = '';
  String rollNo = '';
  String sClass = '';

 final TextEditingController nameController = TextEditingController();
  final TextEditingController rollnoController = TextEditingController();
  final TextEditingController classController = TextEditingController();


  List<Students> studentList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

 getData(){
    APIWeb().postData(StudentRepo.sendRequest("students.php"), '').then((data){
      if(data.status == "success"){
        studentList = data.students;
        update();
      }
      else{
        print(data.msg);
      }
    },);
 }

  dataAdd(){
    APIWeb().postData(CommonRepo.sendRequest("insert.php"), '{"name": "' +
        Uri.encodeFull(name) +
        '", "rollno": "' +
        Uri.encodeFull(rollNo) +
        '", "student_class": "' +
        Uri.encodeFull(sClass) +
        '"}').then((data){
      name = '';
      rollNo = '';
      sClass = '';
      nameController.text = '';
      rollnoController.text = '';
      classController.text = '';
      update();
      if(data.status == "success"){
        Get.snackbar('Insertion', data.msg);

        getData();

        update();
      }
      else{
        print(data.msg);
      }
    },);
  }
}