import 'dart:convert';
import 'package:http/http.dart' as http;

class Question {
  final String? id;  // id is now optional and can be null
  final String title;
  final Map<String, bool> options;
  final String course;

  Question({
    this.id,  // id is optional
    required this.title,
    required this.options,
    required this.course,
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

  Uri _getUserUrl(String uid) {
    return Uri.parse('$baseUrl/users/$uid.json');
  }

  Uri _getUserNameUrl(String uid) {
    return Uri.parse('$baseUrl/users/$uid/name.json');
  }

  String encodeKey(String key) {
    return key
        .replaceAll('.', '%2E')
        .replaceAll('#', '%23')
        .replaceAll('\$', '%24')
        .replaceAll('[', '%5B')
        .replaceAll('±', '%5C')
        .replaceAll('/', '%25')
        .replaceAll('√', '%2D')
        .replaceAll(']', '%5D');
  }

  String decodeKey(String key) {
    return key
        .replaceAll('%2E', '.')
        .replaceAll('%23', '#')
        .replaceAll('%24', '\$')
        .replaceAll('%5B', '[')
        .replaceAll('%5C', '±')
        .replaceAll('%25', '/')
        .replaceAll('%2D', '√')
        .replaceAll('%5D', ']');
  }

  Future<void> addQuestion(Question question) async {
    final url = _getCourseUrl(question.course);
    try {
      // Encode the options keys
      final encodedOptions = question.options.map((key, value) {
        return MapEntry(encodeKey(key), value);
      });

      final response = await http.post(url, body: json.encode({
        'title': question.title,
        'options': encodedOptions,
      }));

      if (response.statusCode == 200) {
        print('Question added successfully: ${question.title}');
      } else {
        print('Failed to add question: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error adding question: $e');
    }
  }

  Future<List<Question>> getQuestionsByCourse(String course) async {
    final url = _getCourseUrl(course);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Data fetched: $data'); // Log the fetched data

        if (data is Map<String, dynamic>) {
          print('Data is Map<String, dynamic>');
          return data.entries.map((entry) {
            final options = entry.value['options'];
            final decodedOptions = _decodeOptions(options);

            return Question(
              id: entry.key,
              title: entry.value['title'],
              options: decodedOptions,
              course: course,
            );
          }).toList();
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        throw Exception('Failed to load questions: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error getting questions: $e');
      throw e;
    }
  }

  Map<String, bool> _decodeOptions(dynamic options) {
    if (options is Map<String, dynamic>) {
      return options.map((key, value) {
        return MapEntry(decodeKey(key), value as bool);
      });
    } else {
      return <String, bool>{};
    }
  }

  // Method to update the user's name in the database
  Future<void> updateUserName(String uid, String name) async {
    final url = _getUserNameUrl(uid);
    try {
      final response = await http.put(url, body: json.encode(name));
      if (response.statusCode == 200) {
        print('User name updated successfully');
      } else {
        print('Failed to update user name: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error updating user name: $e');
    }
  }

  // Method to retrieve the user's name from the database
  Future<String?> getUserName(String uid) async {
    final url = _getUserNameUrl(uid); try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data as String?;
      } else {
        print('Failed to get user name: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error getting user name: $e');
    }
    return null;
  }
}
