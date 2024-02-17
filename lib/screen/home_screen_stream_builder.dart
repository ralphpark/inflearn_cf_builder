
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenStream extends StatefulWidget {
  const HomeScreenStream({super.key});

  @override
  State<HomeScreenStream> createState() => _HomeScreenStreamState();
}

class _HomeScreenStreamState extends State<HomeScreenStream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<int>(
              stream: streamNumbers(),
              builder: (context, AsyncSnapshot<int> snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('StreamBuilder',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${snapshot.connectionState}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${snapshot.data}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text('Error: ${snapshot.error}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('SetState'),
                    ),
                  ],
                );
              }
          ),
        )
    );
  }
  Stream<int> streamNumbers() async* {
    for(int i = 0; i < 10; i++){
      if(i == 5) throw Exception('Error in stream');
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
