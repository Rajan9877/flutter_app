import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:new_flutter_app/view/new.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.red],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 13, left: 20),
                child: Image.asset('assets/img/contact_icon.png', width: 30,)
            ),
            Container(
              margin: EdgeInsets.only(top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(fontSize: 16),),
                  Text(' Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5)
          ),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          child: Image.asset('assets/img/logo.png'),
                        )
                      ],
                    )
                  ],
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 60, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Image.asset('assets/img/small_arrow.png', height: 80,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('WELCOME', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1)),
                            Text('BACK!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1)),
                            Text('Login in to your existant account', style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 70,
                      child: Image.asset('assets/img/people.png'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(top: 35),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey)]
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/img/email.png', scale: 2.5,),
                      hintText: ' Email Address',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)
                      ),

                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey)]
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/img/lock.png', scale: 2,),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1)
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1)
                      ),

                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 25, right: 30),
                child: Text('Forgot Password?', textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => New()));
              }, child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Text('LOGIN', textAlign: TextAlign.center, style: TextStyle(color: Colors.yellow, fontSize: 20),),
              )),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('Or Connect Using', style: TextStyle(color: Colors.grey, fontSize: 17),),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 13),
                            child: Image.asset('assets/img/facebook.png', width: 30,)
                        ),
                        Text('Facebook', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Column(
                      children: [
                        Container(margin: EdgeInsets.only(bottom: 13),child: Image.asset('assets/img/google.png', width: 30,)),
                        Text('Google', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(margin: EdgeInsets.only(bottom: 13),child: Image.asset('assets/img/apple.png', width: 30,)),
                        Text('Apple', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
