import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  
  final Quote quote;
  final Function delete;
  QuoteCard({required this.quote,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[900]
              ),
            ),
            SizedBox(height: 10,),
            Text(
              quote.auothor,
               style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.bottomRight,
              child: 
                TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize:Size(20, 30),
                    primary: Colors.black,
                    backgroundColor: Colors.amber,
                    textStyle: TextStyle(fontWeight:FontWeight.bold)),
                  onPressed: () =>delete(),
                   icon: Icon(
                     Icons.delete
                   ), 
                   label: Text('DELETE'),
                ),
               
            )
          ],
        ),
      ),
    );
  }
}