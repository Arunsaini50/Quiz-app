import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: const QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    // Add your 10 questions here
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'Berlin', 'Madrid', 'Rome'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': ['Earth', 'Mars', 'Venus', 'Jupiter'],
      'correctAnswer': 'Mars',
    },
    {
      'question': 'What is the largest mammal in the world?',
      'answers': ['Giraffe', 'Elephant', 'Blue Whale', 'Hippopotamus'],
      'correctAnswer': 'Blue Whale',
    },
    {
      'question': 'Which gas do plants absorb from the atmosphere?',
      'answers': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
      'correctAnswer': 'Carbon Dioxide',
    },
    {
      'question': 'What is the largest organ in the human body?',
      'answers': ['Liver', 'Brain', 'Skin', 'Heart'],
      'correctAnswer': 'Skin',
    },
    {
      'question': 'Which country is known as the Land of the Rising Sun?',
      'answers': ['South Korea', 'China', 'Japan', 'Vietnam'],
      'correctAnswer': 'Japan',
    },
    {
      'question': 'How many continents are there in the world?',
      'answers': ['4', '5', '6', '7'],
      'correctAnswer': '7',
    },
    {
      'question': 'What is the chemical symbol for gold?',
      'answers': ['Au', 'Ag', 'Fe', 'Hg'],
      'correctAnswer': 'Au',
    },
    {
      'question': 'Which famous scientist developed the theory of relativity?',
      'answers': [
        'Isaac Newton',
        'Niels Bohr',
        'Albert Einstein',
        'Galileo Galilei'
      ],
      'correctAnswer': 'Albert Einstein',
    },
    {
      'question': 'What is the largest desert in the world?',
      'answers': [
        'Gobi Desert',
        'Sahara Desert',
        'Arabian Desert',
        'Antarctica'
      ],
      'correctAnswer': 'Antarctica',
    },

    {
      'question': 'Which gas makes up the majority of Earth\'s atmosphere?',
      'answers': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Methane'],
      'correctAnswer': 'Nitrogen',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answers': ['Earth', 'Mars', 'Venus', 'Jupiter'],
      'correctAnswer': 'Jupiter',
    },
    {
      'question': 'What is the smallest prime number?',
      'answers': ['0', '1', '2', '3'],
      'correctAnswer': '2',
    },
    {
      'question': 'Which country is known as the Land of a Thousand Lakes?',
      'answers': ['Finland', 'Norway', 'Sweden', 'Canada'],
      'correctAnswer': 'Finland',
    },
    {
      'question': 'What is the chemical symbol for water?',
      'answers': ['H2O', 'CO2', 'O2', 'CH4'],
      'correctAnswer': 'H2O',
    },
  ];

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[questionIndex]['correctAnswer']) {
      setState(() {
        score++;
      });
    }
    moveToNextQuestion();
  }

  void moveToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Quiz Completed'),
            content: Text('Your Score: $score / ${questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetQuiz();
                },
                child: const Text('Restart Quiz'),
              ),
            ],
          );
        },
      );
    }
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            questions[questionIndex]['question'],
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Column(
            children: (questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set the button color here
                ),
                onPressed: () {
                  checkAnswer(answer);
                },
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white, // White text color for buttons
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            'Score: $score / ${questions.length}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
