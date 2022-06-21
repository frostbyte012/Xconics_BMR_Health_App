import 'dart:math';

class BMRCalculatorBrain{

  BMRCalculatorBrain({
    required this.height,
    required this.weight,
    required this.gender,
    required this.age,
  });

  final int weight;
  final int height;
  final int gender;
  final int age;

  var _bmr;


  double roundDouble(double value, int places){
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  double bmr_output()
  {

    if(gender==2)
    {
      _bmr=(655+(4.35*weight*2.2)+(4.7*height*0.39)-(4.7*age));
      return roundDouble(_bmr, 1);
    }

    _bmr=(66+(6.23*weight*2.2)+(12.7*height*0.39)-(6.8*age));
    return roundDouble(_bmr, 1);


  }

  int conditionVariables()
  {
    if(_bmr>25.0)
      return 1;
    if(_bmr<=25.0 && _bmr >=18.5)
      return 0;
    if(_bmr<18.5)
      return 2;
    print("Error");
    return 3;
  }
}


