import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height= 120;
  int weight= 40;
  int age= 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Bmi Calculator',style: TextStyle(fontSize: 25),)),),
      body: Column(
        children: [
          Expanded(child:Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale= true;
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male,size: 70.0,),
                        SizedBox(height: 15,),
                        Text('MALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMale ? Colors.blue :Colors.grey[400],
                    ),
                  ),
                )),

                SizedBox(width: 20,),

                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale= false;
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female,size: 70.0,),
                        SizedBox(height: 15,),
                        Text('FEMALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMale ? Colors.grey[400]: Colors.blue,
                    ),
                  ),
                )),
              ],
            ),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${height.round()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
                      SizedBox(width: 1,),
                      Text('CM',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Slider( value: height ,max: 220.0, min: 80.0,
                    onChanged: (value){
                      setState(() {
                        height= value;
                      });
                    },)
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]
              ),
            ),
          )),
          Expanded(child:Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      Text('${age}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              age--; });
                          },
                            mini: true,
                            child: Icon(Icons.remove),),
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              age++; });
                          },
                            mini: true,
                            child: Icon(Icons.add),)
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                )),
                SizedBox(width: 20,),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      Text('${weight}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                            mini: true,
                            child: Icon(Icons.remove),),
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                            mini: true,
                            child: Icon(Icons.add),)
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                )),
              ],
            ),
          )),
          Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                height: 60.0,
                onPressed:(){
                  var result = weight/pow(height/100, 2);
                  showDialog(context: context, builder: (_)=>AlertDialog(
                    title: Text('BMI RESULT',style: TextStyle(fontWeight: FontWeight.bold),),
                    content: Container(
                      height: 100,width: 100,
                      child: Column(
                        children: [
                          Text('${result.round()}',style:TextStyle(fontSize:30,fontWeight: FontWeight.w900),)
                        ],
                      ),
                    ),
                  ));
                },
                child: Text('CALCULATE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),))
        ],
      ),
    );
  }
}