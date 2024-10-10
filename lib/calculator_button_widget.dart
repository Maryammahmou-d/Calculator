import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  Function numberBtn;

  ButtonWidget(this.title,this.numberBtn);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                numberBtn(title);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(50),
               )
              ),
              child: Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              )),
        ));
  }
}
