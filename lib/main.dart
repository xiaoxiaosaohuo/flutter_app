import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/src/Components/LayoutCard.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return new MaterialApp(
      title: "欢迎使用flutter",
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final wordPair = new WordPair.random();
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  int _count = 3;
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
	setState((){
          _suggestions.addAll(generateWordPairs().take(10));
	});
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello1'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  _pushToCard() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new LayoutCard(count: _count);
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.separated(
      padding: const EdgeInsets.all(16.0),
	  separatorBuilder: (context, index) => Divider(
        // color: Colors.black,
      ),
	  itemCount: _suggestions.length,
      itemBuilder: (context, i) {
        return _buildRow(_suggestions[i]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title:
	  Opacity(
		opacity: .8,
		child: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
		) ,
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
            _count++;
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.list), onPressed: _pushToCard),
              ],
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}
