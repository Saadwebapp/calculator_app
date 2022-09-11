import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String  txtToDisplay = "0";
  String result = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String history = "";

   operation(String btntxt) {

    if( btntxt == "C"){
      result = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      history ="";
    }
    else if(btntxt== "+" ||btntxt== "-" ||btntxt== "x" ||btntxt== "/" ){
      num1 = double.parse(txtToDisplay);
      operand = btntxt;
      result = "0";
    }
    else if (btntxt == "="){
      num2 = double.parse(txtToDisplay);


      if(operand == "+"){
        result = (num1+num2).toString();
        history= "$num1$operand$num2=";


      }
      if(operand== "-"){
        result = (num1-num2).toString();
        history= "$num1$operand$num2=";

      }
      if(operand== "x"){
        result = (num1*num2).toString();
        history= "$num1$operand$num2=";      }
      if(operand== "/"){
        result = (num1/num2).toString();
        history= "$num1$operand$num2=";      }

    }
    else{
      result = result + btntxt;
    }
    setState(() {
      txtToDisplay = double.parse(result).toStringAsFixed(2);

    });
  }

  Widget button(String btntxt) {
    return SizedBox(
      height: 110,
      width: 78,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        splashColor: Colors.blueGrey,
        child: Text(
          btntxt,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 60,
          ),
        ),
        onPressed: () {
          operation(btntxt);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xffcdd9e5),
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(08),
                alignment: Alignment.bottomRight,
                child: Text(
                  history,
                  style: const TextStyle(fontSize: 30,color: Colors.black26),

                ),
              ),
              Container(
                padding: const EdgeInsets.all(08),
                alignment: Alignment.bottomRight,
                child: Text(
                  txtToDisplay,
                  style: const TextStyle(fontSize: 70),
                ),
              ),
              Container(
                height: 450,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.black12))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("9"),

                        button("8"),

                        button("7"),

                        button("/"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("6"),

                        button("5"),

                        button("4"),

                        button("x"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("3"),

                        button("2"),

                        button("1"),

                        button("-"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("0"),

                        button("C"),

                        button("="),

                        button("+"),
                        // SizedBox(height: 20,),
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
  //





}
