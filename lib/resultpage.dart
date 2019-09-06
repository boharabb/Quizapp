import 'package:flutter/material.dart';
import 'package:quizapp/Homepage.dart';
class Resultpage extends StatefulWidget {
  int marks;
  Resultpage({Key key, @required this.marks}) : super(key:key);
  @override
  _ResultpageState createState() => _ResultpageState(marks);
}

class _ResultpageState extends State<Resultpage> {
  List<String> images = [
    "images/good.png",
    "images/excellent.png",
    "images/tryagain.jpg",
  ];
  String message;
  String image;
  @override
  void initState(){
    if(marks<20){
      image = images[0];
      message = "You should try hard... \n" "You Scored $marks marks.";
    }else if(marks<25){
  image = images[1];
  message = "You are good... \n" "You Scored $marks marks.";
    }else{
  image = images[2];
  message = "try hard... \n" "You Scored $marks marks.";
    }
    super.initState();
  }
  int marks;
  _ResultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Material(
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
                  child: Material(
                    elevation: 70.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(color: Colors.cyan,
                    
                    height: 350.0, width: 340.0,
                      child: ClipOval(
                        child: Image(
                         // fit: BoxFit.cover,
                          image: AssetImage(image
                          ),
                        ),
                        ), 
                        ),
                  ),
                  
                ),
                Container(
                  child: Text(message, 
                  style:TextStyle(fontSize: 14.0, color:Colors.lightBlue)),
                ),
                SizedBox(height: 30.0,),
                MaterialButton(
                  onPressed: (){
                    return showDialog(
                      
          context: context,
          builder: (context)=>AlertDialog(
            title: Text("Quizapp",),
            content: Text("Are you sure want to Restart."),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();},
                  child: Text("No"),),
                  FlatButton(
               onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Homepage(),));
                },
                 child: Text("Yes"),),
            ],
          ));
                   
                  },
                  color: Colors.grey,
                  splashColor: Colors.indigo,
                  padding:EdgeInsets.symmetric(vertical:15.0, horizontal: 16.0),
                  child: Text("Continue",style:TextStyle(fontSize: 24.0, color:Colors.greenAccent)),
                )
              ],
               ),
          ),
            ),
            
            ),
            
      );}}