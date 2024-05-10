import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Classified extends StatefulWidget {
  const Classified({super.key});

  @override
  State<Classified> createState() => _ClassifiedState();
}

class _ClassifiedState extends State<Classified> {
  @override
  bool onOff = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 50),
        child: Wrap(
          spacing: 3,
          runSpacing: 3,
          alignment: WrapAlignment.center,
          children: [
            for(int n = 0; n < 9; n++)
            GestureDetector(onTap: (){
              setState(() {
                onOff = !onOff;
              });
            }, child: _iconBox(0xff123456, 'location.png', 'Location', onOff, false, gradientValue: LinearGradient(colors: [Colors.green, Colors.yellow], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
          ],
        ),
      )
    );
  }
  Widget _iconBox(int color, String img, String title, bool onOff, bool gradient, {
    Gradient gradientValue = const LinearGradient(
      colors: [Colors.red, Colors.yellow],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  }){
    return Container(
      padding: EdgeInsets.all(5),
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: gradient ? gradientValue : null,
        color: gradient ? null : onOff ? Color(color) : Color(0xff666666),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text( onOff ? 'ON' : 'OFF', style: TextStyle(color: Colors.white, fontSize: 11),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset('assets/img/${img}', width: 25,),
          SizedBox(
            height: 10,
          ),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
