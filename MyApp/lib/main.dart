// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Welcome to Flutter',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Welcome to Flutter'),
//         ),
//         body: new Center(
//           child: new Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';


void main() => runApp(new MyApp());

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('startup name generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Welcome to',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Wlecome to'),
      //   ),
      //   body: Center(
      //     // child: Text('Hello World2'),
      //     child: new RandomWords(),
      //   ),
      // ),
      title: 'startup name generator',
      home: new RandomWords(),
    );
  }
}