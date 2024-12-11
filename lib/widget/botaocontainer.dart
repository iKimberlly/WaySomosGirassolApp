import 'package:flutter/material.dart';

class BotaoContainer extends StatelessWidget{

  BotaoContainer(this.texto, this.onClick);

  final onClick;
  String texto = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: TextButton(onPressed: this.onClick,
          child: Text(this.texto,style: TextStyle(
              fontSize: 22,color: Color(0xFFFFFFFF)
          )),
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFC107)
          ),
        ),
      ),
    );
  }
}
