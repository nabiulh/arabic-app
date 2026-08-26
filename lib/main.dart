import 'package:flutter/material.dart';

void main() {
  runApp(const ArabicLearningApp());
}

class ArabicLearningApp extends StatelessWidget {
  const ArabicLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'সহজ আরবি শিক্ষা',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AlphabetScreen(),
    const VocabularyScreen(),
    const QuizScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আরবি লার্নিং স্টুডিও', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.spellcheck), label: 'বর্ণ ও হরকত'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'শব্দভাণ্ডার'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'কুইজ'),
        ],
      ),
    );
  }
}

// ১. বর্ণমালা ও হরকত স্ক্রিন
class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final List<Map<String, String>> letters = [
    {'char': 'ا', 'name': 'আলিফ'},
    {'char': 'ب', 'name': 'বা'},
    {'char': 'ت', 'name': 'তা'},
    {'char': 'ث', 'name': 'সা'},
    {'char': 'ج', 'name': 'জীম'},
    {'char': 'ح', 'name': 'হা'},
    {'char': 'خ', 'name': 'খা'},
    {'char': 'د', 'name': 'দাল'},
    {'char': 'ذ', 'name': 'যাল'},
    {'char': 'ر', 'name': 'রা'},
    {'char': 'ز', 'name': 'যা'},
    {'char': 'س', 'name': 'সীন'},
    {'char': 'ش', 'name': 'শীন'},
    {'char': 'ص', 'name': 'সোয়াদ'},
    {'char': 'ض', 'name': 'দোয়াদ'},
    {'char': 'ط', 'name': 'তোয়া'},
    {'char': 'ظ', 'name': 'যোয়া'},
    {'char': 'ع', 'name': 'আইন'},
    {'char': 'غ', 'name': 'গাইন'},
    {'char': 'ف', 'name': 'ফা'},
    {'char': 'ق', 'name': 'ক্বফ'},
    {'char': 'ك', 'name': 'কাফ'},
    {'char': 'ل', 'name': 'লাম'},
    {'char': 'م', 'name': 'মীম'},
    {'char': 'ن', 'name': 'নূন'},
    {'char': 'هـ', 'name': 'হা'},
    {'char': 'و', 'name': 'ওয়াও'},
    {'char': 'ي', 'name': 'ইয়া'},
  ];

  int selectedLetterIdx = 1;
  String harakat = '';
  String harakatName = 'মূল বর্ণ';

  @override
  Widget build(BuildContext context) {
    final activeLetter = letters[selectedLetterIdx];

    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          child: Column(
            children: [
              Text(
                '${activeLetter['char']}$harakat',
                style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 8),
              Text(
                '${activeLetter['name']} ($harakatName)',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  _harakatBtn('মূল', '', 'সাধারণ'),
                  _harakatBtn('যবর ( َ )', 'َ', 'যবর সহ'),
                  _harakatBtn('যের ( ِ )', 'ِ', 'যের সহ'),
                  _harakatBtn('পেশ ( ُ )', 'ُ', 'পেশ সহ'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: letters.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedLetterIdx;
              return InkWell(
                onTap: () => setState(() => selectedLetterIdx = index),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.teal[700] : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal.shade200),
                  ),
                  child: Center(
                    child: Text(
                      letters[index]['char']!,
                      style: TextStyle(
                        fontSize: 28,
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _harakatBtn(String label, String mark, String name) {
    final active = harakat == mark;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: active ? Colors.teal : Colors.grey[200],
        foregroundColor: active ? Colors.white : Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      onPressed: () => setState(() {
        harakat = mark;
        harakatName = name;
      }),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}

// ২. শব্দভাণ্ডার স্ক্রিন
class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  final List<Map<String, String>> words = const [
    {'ar': 'مَرْحَبًا', 'pron': 'মারহাবান', 'bn': 'স্বাগতম'},
    {'ar': 'شُكْرًا', 'pron': 'শুকরান', 'bn': 'ধন্যবাদ'},
    {'ar': 'كِتَابٌ', 'pron': 'কিতাবুন', 'bn': 'বই'},
    {'ar': 'قَلَمٌ', 'pron': 'ক্বলমুন', 'bn': 'কলম'},
    {'ar': 'بَيْتٌ', 'pron': 'বাইতুন', 'bn': 'বাড়ি'},
    {'ar': 'مَاءٌ', 'pron': 'মাউন', 'bn': 'পানি'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: words.length,
      itemBuilder: (context, index) {
        final item = words[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(item['ar']!, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal)),
            subtitle: Text('উচ্চারণ: ${item['pron']}'),
            trailing: Text(item['bn']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}

// ৩. কুইজ স্ক্রিন
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = const [
    {'question': 'ب', 'options': ['আলিফ', 'বা', 'তা', 'সা'], 'answer': 'বা'},
    {'question': 'كِتَابٌ', 'options': ['কলম', 'বই', 'বাড়ি', 'পানি'], 'answer': 'বই'},
    {'question': 'شُكْرًا', 'options': ['ধন্যবাদ', 'স্বাগতম', 'মা', 'বাবা'], 'answer': 'ধন্যবাদ'},
  ];

  void checkAnswer(String selected) {
    if (selected == questions[currentQuestion]['answer']) {
      score++;
    }
    if (currentQuestion < questions.length - 1) {
      setState(() => currentQuestion++);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('কুইজ সম্পন্ন!'),
          content: Text('আপনার স্কোর: $score / ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestion = 0;
                  score = 0;
                });
              },
              child: const Text('আবার খেলুন'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('প্রশ্ন ${currentQuestion + 1}/${questions.length}', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          Text(q['question'], style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.teal)),
          const SizedBox(height: 30),
          ...q['options'].map<Widget>((opt) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[50],
                  foregroundColor: Colors.teal[900],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: Colors.teal.shade200),
                ),
                onPressed: () => checkAnswer(opt),
                child: Text(opt, style: const TextStyle(fontSize: 18)),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
