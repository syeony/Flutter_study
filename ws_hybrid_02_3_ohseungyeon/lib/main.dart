import 'package:flutter/material.dart';

void main() {
  runApp(const ColorMyViewsApp());
}

class ColorMyViewsApp extends StatelessWidget {
  const ColorMyViewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorMyViews',
      debugShowCheckedModeBanner: false,
      home: const ColorMyViewsPage(),
    );
  }
}

class ColorMyViewsPage extends StatelessWidget {
  const ColorMyViewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: const Text(
          'ColorMyViews',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // 좌우 8씩 여백
              child: Container(
                height: 30,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  'Box One',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: const Text(
                      'Box Two',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 여백 균등 분배
                      children: [
                        Container(
                          width: 270,
                          height: 30,
                          color: Colors.lightBlue,
                          alignment: Alignment.center,
                          child: const Text(
                            'Box Three',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 270,
                          height: 30,
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: const Text(
                            'Box Four',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 270,
                          height: 30,
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: const Text(
                            'Box Five',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'How to play:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(width: 5),
                Text(
                  'Tap the screen and buttons',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0), // 좌우 8, 아래 16만큼 띄움
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      'RED',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: const Text(
                      'YELLOW',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      'GREEN',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
