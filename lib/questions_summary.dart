import 'package:flutter/material.dart'; 
import 'package:quizzler/summary_identifier.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override

  Widget build(context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data){
              return SummaryIdentifier(
                questionAsked: data['question'] as String, 
                userGuess: data['user_answer'] as String, 
                correctOne: data['correct_answer'] as String, 
                numQuestion: data['question_index'] as int,
              );
            },).toList(),
        ),
      ),
    );
  }
  
}
