import 'package:flutter/material.dart';
import 'calculator_button_widget.dart';

class CalculatorWidget extends StatefulWidget {
  static const String routeName = "Calculator Screen";

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String numberText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      numberText,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget("AC",onAC),
                  ButtonWidget("/",onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget("7",onBtnClicked),
                  ButtonWidget("8",onBtnClicked),
                  ButtonWidget("9",onBtnClicked),
                  ButtonWidget("*",onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget("4",onBtnClicked),
                  ButtonWidget("5",onBtnClicked),
                  ButtonWidget("6",onBtnClicked),
                  ButtonWidget("-",onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget("1",onBtnClicked),
                  ButtonWidget("2",onBtnClicked),
                  ButtonWidget("3",onBtnClicked),
                  ButtonWidget("+",onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget("0",onBtnClicked),
                  ButtonWidget(",",onBtnClicked),
                  ButtonWidget("=",onEqualClicked),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  String LHS="";
  String operation="";

  void onAC(title){
  operation="";
  numberText="";
  setState(() {

  });
  }
  void onBtnClicked(title){
    if(operation=="="){
      operation="";
      numberText=title;
    }
    else {
      numberText += title;
    }
    setState(() {

    });
  }

  void onOperatorClicked(title){
    if(numberText.isEmpty){
      return;
    }
    if(operation.isEmpty) {
      LHS = numberText;
    }
    else{
      String RHS=numberText;
      LHS=calculateResult(LHS,operation,RHS);
    }
    operation=title;
    numberText="";
    setState(() {

    });
  }

  String calculateResult(String LHS,String operation,String RHS){
    int lhs=int.parse(LHS);
    int rhs=int.parse(RHS);
    int result=0;

    if(operation=="+"){
      result=lhs+rhs;
    }else if(operation=="-"){
      result=lhs-rhs;
    }else if(operation=="*"){
      result=lhs*rhs;
    }else if(operation=="/"){
      result=lhs~/rhs;
    }
    return result.toString();
  }

  void onEqualClicked(title){
    String RHS=numberText;
    LHS=calculateResult(LHS, operation, RHS);
    numberText=LHS;
    LHS="";
    operation=title;
    setState(() {

    });
  }

}
