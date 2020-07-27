import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> database = [
    {
      "sender": "Emmett Tomai",
      "subject": "He's lying. I wasn't hacked.",
      "body": "Open it. Send me CC info. Important."
    },
    {
      "sender": "Emmett Tomai",
      "subject": "Hacked. Don't open previous emails.",
      "body": "I was hacked don't open any Bitcoin emails."
    },
    {
      "sender": "Robert Schweller",
      "subject": "RE: Free Bitcoin",
      "body": "Wylie don't...hmm...nvm"
    },
    {
      "sender": "Tim Wylie",
      "subject": "RE: Free Bitcoin",
      "body": "Visa 4345-7613-2314-9000 01/25 889"
    },
    {
      "sender": "Emmett Tomai",
      "subject": "Free Bitcoin",
      "body": "Please send me your CC info so I send Bitcoin..."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gmail"),
          backgroundColor: Colors.red,
        ),
        body: ListView.builder(
          itemCount: database.length,
          itemBuilder: (context, i) {
            return Email(database[i]["sender"], database[i]["subject"],
                database[i]["body"]);
          },
        ));
  }
}

class Email extends StatelessWidget {
  String sender;
  String subject;
  String body;

  Email(this.sender, this.subject, this.body);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(subject, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(body)
            ],
          )
        ],
      ),
    );
  }
}
