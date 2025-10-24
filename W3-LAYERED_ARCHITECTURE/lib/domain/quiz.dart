class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;

  final int points;

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      required this.points});
}

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Player {
  final String name;
  int score;
  int scorePercentage;

  Player({required this.name, this.score = 0, this.scorePercentage = 0});
}

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  int getScoreInPercentage() {
    int totalSCore = 0;

    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalSCore++;
      }
    }
    return ((totalSCore / questions.length) * 100).toInt();
  }

  int getPoints() {
    int totalPoints = 0;

    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalPoints += answer.question.points;
      }
    }

    return totalPoints;
  }

  void addOrUpdatePlayer(String name, int score) {
    var existing = players.firstWhere(
      (p) => p.name == name,
      orElse: () => Player(name: name, score: 0)
    );
    existing.score = score;
    if (!players.contains(existing)) players.add(existing);
  }
}
