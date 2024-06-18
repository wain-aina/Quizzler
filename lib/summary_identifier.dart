import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryIdentifier extends StatelessWidget {
  const SummaryIdentifier({
    super.key, 
    required this.questionAsked,
    required this.userGuess, 
    required this.correctOne,
    required this.numQuestion,
  });

  final String questionAsked;
  final String userGuess;
  final String correctOne; 
  final int numQuestion;

  checkCondition(String x, String y){
    return x == y;
  }

  @override

  Widget build(context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: checkCondition(userGuess, correctOne)
                  ? const Color.fromARGB(255, 150, 198, 241) 
                  : const Color.fromARGB(255, 249, 133, 241), 
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),

          child: Text(
            (numQuestion + 1).toString(), 
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              color: Color.fromARGB(255, 22, 2, 56)
            ),
          ),
        ),
        Expanded(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(questionAsked,
                style: GoogleFonts.lato(
                  color: Colors.white, 
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            const SizedBox(height: 5,),
            Text(userGuess, 
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: checkCondition(userGuess, correctOne)
                    ? const Color.fromRGBO(61, 44, 213, 1) 
                    : const Color.fromARGB(255, 249, 133, 241),
                  )
                ),
            Text(correctOne,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: const Color.fromRGBO(61, 44, 213, 1) 
                  )
                )
          ],),
        )
      ]
    );
  }
}
