import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slidable_button/slidable_button.dart';
import 'dart:math';
import 'package:bmr_xconics_calculator/custom_rounded_button.dart';
import 'bottom_container_button.dart';
import 'package:bmr_xconics_calculator/result_calculation_brain.dart';
import 'package:bmr_xconics_calculator/result_calculation_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {



  double double_round(double val, int places){
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }


  double cm_to_feet_converter(double cm)
  {
    return 0.0328084*cm;
  }



  void subtractWeight()
  {
    setState((){
      if(weight>0)
      {
        weight=weight-1;
      }

    });
  }


  void addWeight()
  {
    setState((){
      if(weight<200)
      {
        weight=weight+1;
      }

    });
  }


  void subtractAge()
  {
    setState((){
      if(age>0)
      {
        age=age-1;
      }

    });
  }


  void addAge()
  {
    setState((){
      if(age<200)
      {
        age=age+1;
      }

    });
  }



  void resultCalculationNavigation()
  {
    print(weight);
    print(height);
    BMRCalculatorBrain bmibrain = new BMRCalculatorBrain(height:height,weight:weight,gender: gender,age:age);
    print(bmibrain.bmr_output());
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultCalculationPage(
      bmr: bmibrain.bmr_output(),)));
  }


  int gender=1,height=180;
  String result="";
  Color maleActiveColor=inactiveCardColor,femaleActiveColor=inactiveCardColor,maleIconcolor=Colors.white,femaleIconColor=Colors.white;
  int weight=50;
  int age=25;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bodyBackgroundColor,
        appBar: AppBar(
          backgroundColor:appbarColor,
        title: Text('BMR CALCULATOR',style: kAppBarTextStyle,),
        ),
        body:

        Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: [

      //-------------------------------------------------GENDER-------------------------------------------------------------------
            Expanded(
              child: Row(
              children: [

                Expanded(child:

                    GestureDetector(
                      onTap: (){
                        setState(() {

                          gender=1;
                          maleIconcolor=backgroundButtonColor;
                          maleActiveColor=activeCardColor;
                          femaleActiveColor=inactiveCardColor;
                          femaleIconColor=Colors.white;

                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:maleActiveColor,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.all(10),child: Icon(FontAwesomeIcons.mars,color:maleIconcolor,size:80.0,),),
                              Text('MALE',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF8D8E98),),)
                            ],
                          ),
                        ),
                      ),
                    )

                ),


                Expanded(child:

                GestureDetector(
                  onTap: (){
                    setState(() {

                      gender=2;
                      femaleIconColor=backgroundButtonColor;
                      femaleActiveColor=activeCardColor;
                      maleActiveColor=inactiveCardColor;
                      maleIconcolor=Colors.white;



                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:femaleActiveColor,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.all(10),child: Icon(FontAwesomeIcons.venus,color:femaleIconColor,size:80.0,),),
                          Text('FEMALE',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF8D8E98)),)
                        ],
                      ),
                    ),
                  ),
                ),
                ),


               ],
              ),
            ),


            //------------------------------------------------GENDER-SECTION-----------------------------------------------
            //------------------------------------------------HEIGHT-------------------------------------------------------


              Expanded(
              child:Container(
                     child: Center(
                              child:
                                Column(
                                 mainAxisAlignment: MainAxisAlignment.center,

                                children: [


                                HorizontalSlidableButton(
                                width: MediaQuery.of(context).size.width / 3,
                                buttonWidth: 60.0,
                                buttonColor: Color(0xFFEB1555),
                                color:Color(0xFF111328),
                                dismissible: false,
                                label: Center(child: Text('HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text('CM',style: TextStyle(color: Colors.white),),
                                Text('FT',style: TextStyle(color: Colors.white),),
                                ],
                                ),
                                ),
                                onChanged: (position) {
                                setState(() {
                                if (position == SlidableButtonPosition.end) {
                                result = 'ft';
                                } else {
                                result = 'cm';
                                }
                                });
                                },
                                ),


                                  SizedBox(height: 15,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(result=='cm'?height.toString():double_round(cm_to_feet_converter(height.toDouble()),1).toString(),style: kNumberTextStyle,),
                                      Text(result=='cm'?'cm':'ft',style: kLabelTextStyle,),
                                    ],
                                  ),



                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.white,
                                        thumbColor:Color(0xFF1EB1555),
                                        thumbShape:RoundSliderThumbShape(enabledThumbRadius: 10.0),
                                        overlayColor:Color(0x291EB1555),
                                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20)

                                    ),
                                    child: Slider(
                                        inactiveColor:Color(0xFF8D8E98),
                                        value: height.toDouble(),
                                        min: 120,
                                        max: 300,
                                        onChanged: (double newValue) {
                                          setState(() {


                                            height=newValue.round();


                                          });
                                        }
                                    ),
                                  ),


                                  ],
                                ),
                           ),
                           margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: activeCardColor,
                           ),
                          ),
                         ),
            //--------------------------------------------------AGE-WEIGHT------------------------------------------------------------


            Expanded(
              child: Row(
                children: [

                  //--------------------------------------------------------------------AGE----------------------------------------------------------------------------------------------------

                  Expanded(child:

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:activeCardColor,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center ,
                            children: [
                              Text('AGE',style: kLabelTextStyle,),
                              Text(age.toString(),style: kNumberTextStyle,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  RoundedMaterialButton(icon: FontAwesomeIcons.minus, func:subtractAge),
                                  SizedBox(width: 10,),
                                  RoundedMaterialButton(icon: FontAwesomeIcons.plus, func:addAge),

                                ],

                              ),

                            ],
                          ),


                        ],
                      ),
                    ),
                  )

                  ),

                  //--------------------------------------------------------------------AGE----------------------------------------------------------------------------------------------------

                  //--------------------------------------------------------------------WEIGHT----------------------------------------------------------------------------------------------------

                  Expanded(child:

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:activeCardColor,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center ,
                            children: [
                              Text('WEIGHT (KG)',style: kLabelTextStyle,),
                              Text(weight.toString(),style: kNumberTextStyle,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedMaterialButton(icon: FontAwesomeIcons.minus, func:subtractWeight),
                                  SizedBox(width: 10,),
                                  RoundedMaterialButton(icon: FontAwesomeIcons.plus, func:addWeight),
                                ],

                              ),

                            ],
                          ),





                        ],
                      ),
                    ),
                  ),
                  ),
//--------------------------------------------------------------------WEIGHT----------------------------------------------------------------------------------------------------

                ],
              ),
            ),
//--------------------------------------------------------------------AGE-WEIGHT-------------------------------------------------------------------------------------------------

          GestureDetector(
            child:BottomContainerButton(label: 'CALCULATE',),
            onTap: (){
              resultCalculationNavigation();
            },
          )



          ],
        ),
      ),
    );
  }
}
