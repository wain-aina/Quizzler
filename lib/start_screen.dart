import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', 
            width: 250,
            color: Colors.black,
          ),
          const SizedBox(height: 40),
          Text("Learn Flutter The Fun Way", style: GoogleFonts.lato(fontSize: 24),),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: startQuiz, 
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent.withOpacity(0.8)
              ),
            child: const Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Text(
                  'Start Quiz', 
                  style: TextStyle(
                    fontSize: 18, 
                    color: Colors.white
                  ),
                ), 
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white, 
                )
              ],),
            )
        ],
      ),
    );
  }
}