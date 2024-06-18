import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler/data/questions.dart';
import 'package:quizzler/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRestart
  });

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i=0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) => data['user_answer'] == data['correct_answer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
              style: GoogleFonts.lato(
                color: Colors.white, 
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent.withOpacity(0.5)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.restart_alt_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'Restart Quiz',
                  style: TextStyle(
                    fontSize: 18, 
                    color: Colors.white
                  ),
                ),
              ],
            ),
          )
          ]
          ),
      ),);
  }
}