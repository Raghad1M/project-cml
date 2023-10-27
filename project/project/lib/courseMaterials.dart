import 'package:flutter/material.dart';

class CourseMaterialsPage extends StatelessWidget {
  final String courseName;

  CourseMaterialsPage({required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
      ),
      body: ListView(
        children: <Widget>[
          MaterialSection(
            icon: Icons.message,
            title: "Discussion Boards",
            description: "where you can interact with other learners",
          ),
          MaterialSection(
            icon: Icons.article,
            title: "Articles",
            description:
                "Articles that offer in-depth written content on specific topics, often accompanied by diagrams, examples, and references.",
          ),
          MaterialSection(
            icon: Icons.question_answer,
            title: "Quizzes",
            description:
                "Quizzes are sets of questions designed to assess your understanding and recall of the material.",
          ),
          MaterialSection(
            icon: Icons.assignment,
            title: "Assignments",
            description:
                "Assignments that provide a structured way for you to apply what you've learned in a practical manner",
          ),
          MaterialSection(
            icon: Icons.videocam,
            title: "Videos",
            description: "Videos provide visual and auditory understanding.",
          ),
        ],
      ),
    );
  }
}

class MaterialSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  MaterialSection({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 36.0,
        color: const Color.fromARGB(255, 18, 19, 102),
      ),
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
