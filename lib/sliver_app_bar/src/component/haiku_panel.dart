import 'package:flutter/material.dart';

class HaikuPanel extends StatelessWidget {
  final String haiku;

  const HaikuPanel({Key? key, required this.haiku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  haiku,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('LIKE'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('READ'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
