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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DiscussionBoardPage()),
              );
            },
          ),
          MaterialSection(
            icon: Icons.article,
            title: "Articles",
            description:
                "Articles that offer in-depth written content on specific topics, often accompanied by diagrams, examples, and references.",
                 onTap: (){}
          ),
          MaterialSection(
            icon: Icons.question_answer,
            title: "Quizzes",
            description:
                "Quizzes are sets of questions designed to assess your understanding and recall of the material.",
               onTap: (){}
          ),
          MaterialSection(
            icon: Icons.assignment,
            title: "Assignments",
            description:
                "Assignments that provide a structured way for you to apply what you've learned in a practical manner",
               onTap: (){}
          ),
          MaterialSection(
            icon: Icons.videocam,
            title: "Videos",
            description: "Videos provide visual and auditory understanding.",
           onTap: (){}
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
  final VoidCallback? onTap;

  MaterialSection({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 36.0,
          color: const Color.fromARGB(255, 18, 19, 102),
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}class DiscussionPostModel {
  final String username;
  final String content;

  DiscussionPostModel({required this.username, required this.content});
}

class DiscussionBoardPage extends StatelessWidget {
  final SampleDiscussionBoard _sampleDiscussionBoard = SampleDiscussionBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion Board'),
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
      ),
      body: _sampleDiscussionBoard,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final message = await showDialog<String>(
            context: context,
            builder: (context) => NewPostDialog(),
          );
          if (message != null && message.isNotEmpty) {
            _sampleDiscussionBoard.addNewPost("User", message); 
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewPostDialog extends StatefulWidget {
  @override
  _NewPostDialogState createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create a New Post"),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: "Enter your message"),
        maxLines: 4,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Navigator.of(context).pop(_controller.text);
            }
          },
          child: Text("Post"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SampleDiscussionBoard extends StatefulWidget {
  final _state = _SampleDiscussionBoardState();

  void addNewPost(String username, String content) {
    _state.addNewPost(username, content);
  }

  @override
  _SampleDiscussionBoardState createState() => _state;
}

class _SampleDiscussionBoardState extends State<SampleDiscussionBoard> {
  List<DiscussionPostModel> posts = [
    DiscussionPostModel(username: "User A", content: "This course material has been very helpful!"),
    DiscussionPostModel(username: "User B", content: "I'm having a little difficulty with topic 2. Any advice?")
  ];

  void addNewPost(String username, String content) {
    setState(() {
      posts.add(DiscussionPostModel(username: username, content: content));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: posts.map((post) => DiscussionPost(username: post.username, content: post.content)).toList(),
      ),
    );
  }
}

class DiscussionPost extends StatelessWidget {
  final String username;
  final String content;

  DiscussionPost({required this.username, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }
}
