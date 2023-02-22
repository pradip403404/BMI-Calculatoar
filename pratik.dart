import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI APP"),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/bmi.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "BMI",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                        label: Text("Enter your weight in kgs"),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                        label: Text("Enter your height in foot"),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        label: Text("Enter your height in inches"),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //BMI calculation
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;

                          var bmi = iWt / (tM * tM);

                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are over weight!!";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You are under weight";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are healthy";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "Your BMI is: ${bmi.toStringAsFixed(2)}\n $msg";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!!";
                          });
                        }
                        ;
                      },
                      child: Text("Calculate"),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
