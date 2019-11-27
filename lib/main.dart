import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
main(){
  runApp(
      new MaterialApp(
        home: Bmimeasure(),
      )
  );
}
class Bmimeasure extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Bmi();
  }

}
class Bmi extends State<Bmimeasure>{
  final TextEditingController _heightcontroller=new TextEditingController();
  final TextEditingController _weightcontroller=new TextEditingController();
  final TextEditingController _agecontroller=new TextEditingController();
  double inches=0.0;
  double result=0.0;
  String resultcontrol="";
  String _finalresult="";
  void bmicontroller(){
    setState(() {
      int age=int.parse(_agecontroller.text);
      double height=double.parse(_heightcontroller.text);
      double weight=double.parse(_weightcontroller.text);
      inches=height*12;
      if((_agecontroller.text.isNotEmpty||age>0)&&
          ((_weightcontroller.text.isNotEmpty)||weight>0)&&
          ((_heightcontroller.text.isNotEmpty)||inches>0)){
        result=weight/(inches*inches)*703;
        if(double.parse(result.toStringAsFixed(1))<18.5) {
          resultcontrol = 'Please Gain some Weight';
        }
        else if(double.parse(result.toStringAsFixed(1))>=18.5&&(double.parse(result.toStringAsFixed(1))<25)){
          resultcontrol="You are really fit";
        }
        else if(double.parse(result.toStringAsFixed(1))>=25&&(double.parse(result.toStringAsFixed(1))<30)){
          resultcontrol="Please reduce weight ";
        }
        else if((double.parse(result.toStringAsFixed(1))>30))
        {
          resultcontrol="You are Obese So kindly go to GYM";
        }
      }
      else{
        result=0.0;
      }

    });
    _finalresult="Your Bmi is ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI APP'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment:Alignment.topCenter,
        child: new ListView(
          padding: EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset('images/rk.png',height: 75,width: 75),
            new Container(
              height: 290,
              width: 290,
              color: Colors.grey,
              padding: EdgeInsets.all(2.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                      controller: _agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(hintText: 'enter age',icon: new Icon(Icons.bubble_chart),labelText: 'AGE')
                  ),
                  new Padding(padding: EdgeInsets.all(7.5)),
                  new TextField(
                      controller: _weightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(hintText: 'enter weight',icon: new Icon(Icons.accessibility),labelText: 'WEIGHT')
                  ),
                  new Padding(padding: EdgeInsets.all(7.5)),
                  new TextField(
                      controller: _heightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(hintText: 'enter height in feet',icon: new Icon(Icons.person),labelText: 'HEIGHT')
                  ),
                  new Padding(padding: EdgeInsets.all(7.5)),
                  new RaisedButton(onPressed:bmicontroller,
                    child: new Text('Calculate'),
                    textColor: Colors.white,
                    color: Colors.pink,),
                ],
              ),

            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'BMI : $_finalresult',
                  style: new TextStyle(
                    fontSize: 19.9,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(5)),
                new Text(
                  '$resultcontrol',
                  style: new TextStyle(
                    fontSize: 19.9,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.pink,
                  ),
                ),

              ],
            )

          ],



        ),

      ),

    );
  }

}

