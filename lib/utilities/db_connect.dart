import 'dart:convert';
import 'package:http/http.dart' as http;

class Question {
  final String id;
  final String title;
  final Map<String, bool> options;
  final String course;  // Add course attribute

  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.course,  // Add course parameter
  });

  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options, course: $course)';
  }
}



class DBconnect {
  final baseUrl = 'https://knustexammate-default-rtdb.firebaseio.com/';

  Uri _getCourseUrl(String course) {
    return Uri.parse('$baseUrl/courses/$course/questions.json');
  }

  Future<void> addQuestion(Question question) async {
    final url = _getCourseUrl(question.course);
    await http.post(url, body: json.encode({
      'title': question.title,
      'options': question.options,
    }));
  }

  Future<List<Question>> getQuestionsByCourse(String course) async {
    final url = _getCourseUrl(course);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return data.entries.map((entry) {
        return Question(
          id: entry.key,
          title: entry.value['title'],
          options: Map<String, bool>.from(entry.value['options']),
          course: course,
        );
      }).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
