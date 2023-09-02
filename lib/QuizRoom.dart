import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cashquiz/Models/QuizModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Toast.dart';
class QuizRoom extends StatefulWidget {
  const QuizRoom({super.key});

  @override
  State<QuizRoom> createState() => _QuizRoomState();
}

class _QuizRoomState extends State<QuizRoom> {
  @override

  var quiz;
  var correct;
  var opt1;
  var opt2;
  var _check;
  var Radnom = Random();
  var rnd = 1;
  var OldOption1 = true;var OldOption2 = true;var OldOption3 = true;
  var newOption1 = false;var newOption2 = false;var newOption3 = false;var wrongOption1 = false;
  var clicked = false;var wrongOption2 = false;var wrongOption3 = false;
  List<QuizModel> _Quizlist =[];

  Future<List<QuizModel>> _QUIZAPI ()async{

    final response = await http.get(Uri.parse("https://the-trivia-api.com/v2/questions"));
    var data = jsonDecode(response.body.toString());
    // print(data);
    if(response.statusCode == 200){
      _Quizlist.clear();
      setState(() {
        rnd = Radnom.nextInt(7);
      });
      for(Map i in data){
        _Quizlist.add(QuizModel.fromJson(i));
      }



      print ('${_Quizlist[0].question!.text.toString()}');
      print ('${_Quizlist[0].correctAnswer.toString()}');
      print ('${_Quizlist[0].incorrectAnswers!.first}');
      print ('${_Quizlist[0].incorrectAnswers!.last}');


      _check = _Quizlist[0].correctAnswer.toString();
      quiz = _Quizlist[0].question!.text.toString();

      if(rnd == 0){
        opt2 = _Quizlist[0].incorrectAnswers!.first.toString();
        opt1 = _Quizlist[0].correctAnswer.toString();
        correct = _Quizlist[0].incorrectAnswers!.last.toString();

      }
      else if(rnd == 1){
        opt1 = _Quizlist[0].incorrectAnswers!.first.toString();
        opt2 = _Quizlist[0].correctAnswer.toString();
        correct = _Quizlist[0].incorrectAnswers!.last.toString();

      }else if(rnd == 2){
        opt1 = _Quizlist[0].correctAnswer.toString();
        opt2 = _Quizlist[0].incorrectAnswers!.last.toString();
        correct = _Quizlist[0].incorrectAnswers!.first.toString();

      }else if(rnd == 3){
        opt2 = _Quizlist[0].incorrectAnswers!.first.toString();
        correct = _Quizlist[0].correctAnswer.toString();
        opt1 = _Quizlist[0].incorrectAnswers!.last.toString();

      }if(rnd == 4){
        opt1 = _Quizlist[0].correctAnswer.toString();
        opt2 = _Quizlist[0].incorrectAnswers!.last.toString();
        correct = _Quizlist[0].incorrectAnswers!.first.toString();

      }
      else if(rnd == 5){
        opt2 = _Quizlist[0].correctAnswer.toString();
        opt1 = _Quizlist[0].incorrectAnswers!.first.toString();
        correct = _Quizlist[0].incorrectAnswers!.last.toString();

      }else if(rnd == 6){
        opt1 = _Quizlist[0].incorrectAnswers!.last.toString();
        correct = _Quizlist[0].correctAnswer.toString();
        opt2 = _Quizlist[0].incorrectAnswers!.first.toString();

      }else if(rnd == 7){
        opt1 = _Quizlist[0].incorrectAnswers!.first.toString();
        opt2 = _Quizlist[0].incorrectAnswers!.last.toString();
        correct = _Quizlist[0].correctAnswer.toString();

      }else{
        opt1 = _Quizlist[0].incorrectAnswers!.first.toString();
        opt2 = _Quizlist[0].correctAnswer.toString();
        correct = _Quizlist[0].incorrectAnswers!.last.toString();
      }
      //
      // opt1 = _Quizlist[0].incorrectAnswers!.last.toString();
      // opt2 = _Quizlist[0].incorrectAnswers!.first.toString();


      setState(() {

      });
      return _Quizlist;
    }
    return _Quizlist;
  }
  void initState() {
    setState(() {

      setState(() {

      });
      _QUIZAPI();
    });
    super.initState();
  }

  @override

  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            InkWell(
                onTap: (){
                  initState();
                  setState(() {

                  });
                },
                child: Text("$quiz",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),)),



            InkWell(
              onTap: clicked? (){}: (){

                clicked = true;
                if(opt1 == _check){

                  Timer.periodic(Duration(seconds: 2), (timer) {
                    OldOption1 = true;
                    newOption1 = false;
                    clicked = false;
                    initState();
                  });
                  setState(() {
                    OldOption1 = false;
                    newOption1 = true;

                  });
                }
                else{


                  Timer.periodic(Duration(seconds: 2), (timer) {
                    OldOption1 = true;
                    wrongOption1 = false;
                    clicked = false;
                    initState();
                  });
                  setState(() {
                    OldOption1 = true;
                    wrongOption1 = false;
                    initState();
                  });
                }
              },
              child:
              Column(
                children: [
                  Visibility(
                    visible: OldOption1,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$opt1",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                  Visibility(
                    visible: newOption1,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$opt1",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                  Visibility(
                    visible: wrongOption1,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$opt1",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                ],
              )

            ),
            InkWell(
              onTap: clicked?(){}:(){
                clicked = true;
                if(opt2 == _check){
                  Timer.periodic(Duration(seconds: 2), (timer) {
                    OldOption2 = true;
                    newOption2 = false;
                    clicked = false;
                    initState();
                  });

                  setState(() {
                    OldOption2 = false;
                    newOption2 = true;

                  });

                } else{

                  Timer.periodic(Duration(seconds: 2), (timer) {
                    OldOption1 = true;
                    wrongOption1 = false;
                    clicked = false;
                    initState();
                  });
                  setState(() {
                    OldOption2 = false;
                    wrongOption2 = true;
                    initState();
                  });
                }
              },
              child:
              Column(
                children: [
                  Visibility(
                    visible: OldOption2,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$opt2",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                  Visibility(
                    visible: newOption2,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$opt2",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                  Visibility(
                    visible: wrongOption2,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$opt2",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                ],
              )


            ),
            InkWell(
              onTap: clicked?(){}:(){
                clicked = true;
                if(correct == _check){

                  Timer.periodic(Duration(seconds: 2), (timer) {
                    OldOption3 = true;
                    newOption3 = false;
                    clicked = false;
                    initState();
                  });
                  setState(() {
                    OldOption3 = false;
                    newOption3 = true;

                  });
                } else{

                  Timer.periodic(Duration(seconds: 2), (timer) {
                    OldOption1 = true;
                    wrongOption1 = false;
                    clicked = false;
                    initState();
                  });
                  setState(() {
                    OldOption3 = false;
                    wrongOption3 = true;
                    initState();

                  });
                }
              },
              child: Column(
                children: [
                  Visibility(
                    visible: OldOption3,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$correct",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                  Visibility(
                    visible: newOption3,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$correct",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                  Visibility(
                    visible: wrongOption3,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height *0.1,

                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$correct",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                        ),
                      )
                      ),),
                  ),
                ],
              )

            ),






          ],
        ),
      ),
    );
  }
}
