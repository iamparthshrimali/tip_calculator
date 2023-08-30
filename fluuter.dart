import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var key1 = GlobalKey();
    var key2 = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              key: key1,
              color: Colors.yellow,
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _scrollToKey(key2);
                  },
                  child: const Text("Scroll down"),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              key: key2,
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _scrollToKey(key1);
                  },
                  child: const Text("Scroll up"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext!;
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero).dy;
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
