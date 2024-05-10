import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        ),
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              child: Image.asset('assets/img/logo.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    child: Image.asset('assets/img/down_arrow.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("LET'S GET", style: TextStyle(fontSize: 50, height: 1, fontWeight: FontWeight.bold),),
                      Text("STARTED", style: TextStyle(fontSize: 50, height: 1, fontWeight: FontWeight.bold),),
                      Text("Your City Latest updates now", style: TextStyle(fontSize: 18),),
                      Text("in your pocket", style: TextStyle(fontSize: 18),),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  child: Image.asset('assets/img/events.jpg'),
                                ),
                                Text('EVENTS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  child: Image.asset('assets/img/events.jpg'),
                                ),
                                Text('EDITORIALS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  child: Image.asset('assets/img/coupons.jpg'),
                                ),
                                Text('COUPONS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  child: Image.asset('assets/img/business.jpg'),
                                ),
                                Text('BUSINESS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                child: Image.asset('assets/img/classified.jpg'),
                              ),
                              Text('CLASSIFIED', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                child: Image.asset('assets/img/jobs.jpg'),
                              ),
                              Text('JOBS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              }, child: Text('LOGIN', style: TextStyle(color: Colors.yellow, fontSize: 20),)
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 17),
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              child: TextButton(onPressed: (){}, child: Text('CREATE A NEW ACCOUNT', style: TextStyle(color: Colors.yellow, fontSize: 20),)
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
