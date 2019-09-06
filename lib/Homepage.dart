import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/getjson.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  List<String> images =[
    "images/one.png",
    "images/one.png",
   
  ];
  Widget customcard(String name, String image){
    return Padding(
      padding: EdgeInsets.all(
        20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context)=> Getjson() ));
        },
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.pink,
          elevation: 10.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: 
                EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(1.0),
                  child:Container(
                    color: Colors.orange,
                    height: 250.0,
                    width:250.0,
                    child: ClipOval(
                      child: Image(
                        //fit: BoxFit.cover,
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                Center(
                  child: Text(name,style: TextStyle(
            fontFamily: "Oxygen", fontSize: 16.0, color: Colors.indigo, 
            fontWeight: FontWeight.w600,),),
                ),
                Container(
                  padding:EdgeInsets.all(20.0),
                  child:Text(
                    "hello my name is birendra\nbohara im from nepal \ni live in nepaljung",
                    style: TextStyle(
            fontFamily: "Oxygen", fontSize: 16.0, color: Colors.green),
            maxLines: 3,
            textAlign: TextAlign.justify, ),
            
                ),              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EPS-TOPIK", style: TextStyle(
            fontFamily: "Oxygen", fontSize: 16.0, color: Colors.white70), ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Paper 1", images[0]),
          customcard("Paper 2", images [1]),
         
        ],
      ),
    );
  }
}