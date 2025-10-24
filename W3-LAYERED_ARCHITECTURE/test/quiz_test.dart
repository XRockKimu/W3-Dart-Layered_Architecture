import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  test('My first test', () {
    Question q1 = Question(
        title: "2025 - 2004", 
        choices: ["11", "21", "31"], 
        goodChoice: "21", 
        points: 10);
    Question q2 = Question(
        title: "42 / 2", 
        choices: ["11", "21", "31"], 
        goodChoice: "21", 
        points: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    // Answer are all good
    quiz.addAnswer(Answer(question: q1, answerChoice: "221"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "21"));

    // SCore eis 100
    expect(quiz.getScoreInPercentage(), equals(100));
    expect(quiz.getPoints(), equals(60));
  });
}
