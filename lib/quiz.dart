import 'package:flutter/material.dart';
import 'package:quizzler/data/questions.dart';
import 'package:quizzler/question_screen.dart';
import 'package:quizzler/results.dart';
import 'package:quizzler/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen(){
    setState((){
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState((){
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz(){
    setState((){
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override

  Widget build(context){

    // final screenWidget = activeScreen == 'start-screen' 
    //          ? StartScreen(switchScreen) 
    //          : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'result-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.lightGreenAccent
            ], 
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
            )
      ),
          child: screenWidget,
        ),
      ),
    );
  }
}
