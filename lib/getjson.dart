import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/Homepage.dart';
import 'package:quizapp/resultpage.dart';
class Getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/Quiz.json"),
      builder: (context, snapshot){
        var mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text("loading..."),
            ),
          );
        }else {
          return Quizapp(mydata:mydata);
        }
      },
    );
  }
}
class Quizapp extends StatefulWidget {
  var mydata;
  Quizapp({Key key, @required this.mydata}): super(key:key);
  @override
  _QuizappState createState() => _QuizappState(mydata);
}

class _QuizappState extends State<Quizapp> {
  var mydata;
   _QuizappState(this.mydata);
   Color colortoshow = Colors.grey;
   Color right = Colors.white;
   Color wrong = Colors.redAccent;
   int marks =0;
   int i =1;
   int timer = 30;
   String showtimer = "30";

   Map<String, Color> btncolor = {
     "a" :Colors.blueGrey,
     "b" :Colors.blueGrey,
     "c" :Colors.blueGrey,
     "d" :Colors.blueGrey,};
     bool canceltimer=false;

     @override
     void initState(){
       starttimer();
       super.initState();
     }

     void starttimer() async {
       const onesec = Duration(seconds: 1);
       Timer.periodic(onesec, (Timer t){
         setState(() {
          if(timer <1){
            t.cancel();
            nextquestion();
          }else if(canceltimer ==true){
            t.cancel();
          }else{
            timer = timer-1;
          }
          showtimer = timer.toString();
         });
       });
       }

   void nextquestion(){
     canceltimer = false;
     timer = 30;
     setState(() {
      if(i<7){
       i++;
     }else{Navigator.of(context).pushReplacement(MaterialPageRoute(
       builder: (context)=> Resultpage(marks : marks),));}

     btncolor["a"]=Colors.blueGrey; 
     btncolor["b"]=Colors.blueGrey; 
     btncolor["c"]=Colors.blueGrey; 
     btncolor["d"]=Colors.blueGrey; 
     });
     starttimer();
   }
   void checkanswer(String k){
     if(mydata[2][i.toString()]==mydata[1][i.toString()][k]){
       marks = marks+6;
       colortoshow = right;
     } else{
       colortoshow = wrong;
       }
       setState(() {
         btncolor[k] = colortoshow;
         canceltimer =true;
       });
       Timer(Duration(seconds: 1), nextquestion);
   }
  Widget choicebutton( String k){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(mydata[1][i.toString()//["1"]
        ][k], style: TextStyle(
          fontSize: 16.0, fontFamily: "Times New Roman"),),
          color: btncolor[k], //Colors.brown
          splashColor: Colors.cyan,
          minWidth: 200.0,
          height: 46.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
      ),    ),    );  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text("Quizapp",),
            content: Text("you can not go back at this Stage."),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();},
                  child: Text("No"),),
                  FlatButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Homepage(),));},
                  child: Text("Yes"),),
            ],
          )
        );
      },
      child: Scaffold(
      body: Column(children: <Widget>[
        Expanded(
        
          flex:2,
          child: Container(
            color: Colors.white24,
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(mydata[0][i.toString()] //["1"]
            , style: TextStyle(fontSize: 24.0, ),),
          ),  ),
         Expanded(
           
          flex:3,
          child: Container(
            color: Colors.white10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                choicebutton('a'),
                choicebutton('b'),
                choicebutton('c'),
                choicebutton('d'),
              ], ), ),),
        
         Expanded(
          flex:1,
          child: Container(
            color:Colors.grey,
            alignment: Alignment.center,
            child: Text(showtimer,style: TextStyle(
          fontSize: 26.0, fontFamily: "Times New Roman"),),
          ),
        ),
      ],)
      
    )
    );
  }
}