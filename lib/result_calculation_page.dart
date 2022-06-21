import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_container_button.dart';
import 'dart:math';

class ResultCalculationPage extends StatefulWidget {

  ResultCalculationPage({required this.bmr});

  final double bmr;

  @override
  State<ResultCalculationPage> createState() => _ResultCalculationPageState();
}

class _ResultCalculationPageState extends State<ResultCalculationPage> {

  void inputPageNavigator()=>Navigator.pop(context);

  double double_round(double val, int places){
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMR CALCULATOR',style: kAppBarTextStyle,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0) ,
            child: Text("Your Result",style: kYourResultTextStyle,),
          ),

          Expanded(
            child:Container(
              margin:EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kActiveCardColour,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Container(
                margin:EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(double_round(widget.bmr,1).toString(),style: kNumberResultTextStyle,),
                      SizedBox(height: 30,),
                      Padding(padding:EdgeInsets.fromLTRB(80,0,0,0),child: Text('Calories/day',style:TextStyle(color: Colors.green,fontSize: 25),)),
                    ],
                  ),
                ),
              ),

            ),
          ),

          GestureDetector(
              child:BottomContainerButton(label:'RE-CALCULATE'),
              onTap: inputPageNavigator),
        ],
      ),
    );
  }
}
