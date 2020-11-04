import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int current_step = 0;

  List<Step> steps = [
    Step(
      title: Text('Step 1'),
      content: Text('Hello!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('World!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Hello World!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Stepper Demo")),
      body: Container(
        child: Stepper(
          controlsBuilder: (BuildContext context, { VoidCallback onStepContinue, VoidCallback onStepCancel }){
            return Row(
              children: [
                Container(
                  color: Colors.blueAccent,
                  child: FlatButton(
                      onPressed:onStepContinue , child: Text("Next")),
                ),
                FlatButton(
                    onPressed:onStepCancel , child: Text("Back"))
              ],
            );

          } ,
          currentStep: this.current_step,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              current_step = step;
              print(step);
            });
          },
          onStepContinue: () {
            setState(() {
              print("onStepContinue ");
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            print("onStepCancel ");
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }});},),),);
  }
}
