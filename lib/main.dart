import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent.shade100),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var heightFtC = TextEditingController();
  var heightInC = TextEditingController();
  var weightC = TextEditingController();
  var result ="";
  var bgcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffdec6c0),
                Color(0Xffffd1ff),
              ],
              begin: FractionalOffset(0,0),
                end: FractionalOffset(0.0,1.0)
            )
          ),
          color: bgcolor,
          child: Center(
              child: SizedBox(width: 300,height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('BMI Calculator',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w200,fontSize: 34),),
                    TextField(
                      controller: weightC,
                      decoration: const InputDecoration(
                        label: Text('Enter weight'),
                        prefix: Icon(Icons.line_weight_rounded),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: heightFtC,
                      decoration: const InputDecoration(
                        label: Text('Enter your height in fits'),
                        prefix: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: heightInC,
                      decoration: const InputDecoration(
                        label: Text('Enter your height in inches'),
                          prefix: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),

                    ElevatedButton(onPressed: (){
                      var ft = heightFtC.text.toString();
                      var inc = heightInC.text.toString();
                      var wt = weightC.text.toString();
                      if(ft!=""&&wt!=""&&inc!=''){
                        var ftI= int.parse(ft);
                        var incI= int.parse(inc);
                        var wtI= int.parse(wt);
                        dynamic total = ((((12*ftI)+incI)*2.54)/100);
                        setState(() {
                          var ans = wtI/(total*total);
                        result=ans.toStringAsFixed(2);
                        if(ans>25){
                          bgcolor = Colors.red;
                        }
                        if(ans>=18){
                          bgcolor = Colors.green;
                        }
                        if(ans<18){
                          bgcolor = Colors.blue;
                        }
                        });
                      }else{
                        result = "please fill all the fields";
                        setState(() {
                        });
                      }
                    }, child: const Text('calculate')),
                    const SizedBox(height: 20),
                  Text('Your BMI : $result.'),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
