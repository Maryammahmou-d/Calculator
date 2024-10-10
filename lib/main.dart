import 'package:flutter/material.dart';
import 'calculator_widget.dart';

main(){
  runApp(MaterialApp(
    initialRoute: CalculatorWidget.routeName,
    routes:{
      CalculatorWidget.routeName:(context)=>CalculatorWidget(),
    },
  ));
}

