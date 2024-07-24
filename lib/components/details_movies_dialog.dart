import 'package:flutter/material.dart';

class MovieDialog extends StatelessWidget {
  final String title;
  final String year;
  final String description;
  final String score;
  final String whereToWatch;

  const MovieDialog(
      {super.key, required this.title,
      required this.year,
      required this.description,
      required this.score,
      required this.whereToWatch});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Ano: $year'),
            const SizedBox(height: 8),
            Text('Descrição: $description'),
            const SizedBox(height: 8),
            Text('Score: $score'),
            Text('Onde Assitir: $whereToWatch')
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Fechar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
