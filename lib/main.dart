import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Awesome Quote'),
          centerTitle: true,
        ),
        body: QuoteList(),
      ),
    );
  }
}

class QuoteList extends StatefulWidget {

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: 'I love winning the game', auothor: 'Marry Hensi'),
    Quote(text: 'Bring the game home', auothor: 'Choco White'),
    Quote(text: 'In concluding Happiness',auothor: 'James Camoreon', ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: quotes.map((item) => QuoteCard(
          quote:item,
          delete:(){
            setState(() {
              quotes.remove(item);
            });
          }
          )).toList(),
      ),
    );
  }
}
