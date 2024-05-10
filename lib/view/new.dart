import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flutter_app/view/classified.dart';
import 'package:new_flutter_app/controller/new_controller.dart';

class New extends StatelessWidget {
  final NewController _con = Get.put(
    NewController()
  );
  New({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewController>(builder: (controller) => Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                Get.to(()=> Classified());
              }, child: Text('Next Screen')),
              Text(_con.number.toString()),
              TextButton(
                child: Text(_con.buttonName),
                onPressed: (){
                  _con.number=_con.number + 2;
                  _con.update();
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _con.studentList.length,
                itemBuilder: (context, index) {
                return Card(
                  color: Colors.red,
                  child: ListTile(
                    title: Text(_con.studentList[index].name, style: TextStyle(color: Colors.white),),
                    subtitle: Text(_con.studentList[index].student_class, style: TextStyle(color: Colors.white)),
                    trailing: Text(_con.studentList[index].rollno, style: TextStyle(color: Colors.white)),
                  ),
                );
              },),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  onChanged: (value) {
                    _con.name = value;
                    _con.update();
                  },
                  controller: _con.nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2) ,borderRadius: BorderRadius.circular(50)),
                    contentPadding: EdgeInsets.all(20),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2) ,borderRadius: BorderRadius.circular(50))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _con.rollnoController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.red),
                  onChanged: (value) {
                    _con.rollNo = value;
                    _con.update();
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Rollno",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2) ,borderRadius: BorderRadius.circular(50)),
                      contentPadding: EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2) ,borderRadius: BorderRadius.circular(50))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  onChanged: (value) {
                    _con.sClass = value;
                    _con.update();
                  },
                  controller: _con.classController,
                  decoration: InputDecoration(
                      hintText: "Enter Your Class",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2) ,borderRadius: BorderRadius.circular(50)),
                      contentPadding: EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2) ,borderRadius: BorderRadius.circular(50))
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: TextButton(onPressed: (){
                _con.dataAdd();
                }, child: Text('Submit', style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
