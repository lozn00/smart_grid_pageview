import 'package:flutter/material.dart';
import 'package:smart_gridded_pageview/grid_pageview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GRIDVIEW PAGEVIEW'),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                color: Colors.yellow,
                child: const Text('This is height auto,minHeight 5 '),
              ),
            ),
            GridPageView(
                column: 5,
                minheight: 5,
                row: 2,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
                    .asMap()
                    .entries
                    .map((e) {
                  return Container(
                      color: e.key % 2 == 0 ? Colors.blue : Colors.yellow,
                      height: 30,
                      child: Text("${e.key} = ${e.value}"));
                }).toList()),
            Center(
              child: Container(
                color: Colors.yellow,
                child: const Text('This is height auto,minHeight 0 '),
              ),
            ),
            GridPageView(
                column: 5,
                minheight: 0,
                row: 2,
                columnSpacing: 5,
                indicatorBuild: (controller, focused, index) {
                  return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //           _currentPage = i;
                        //         });

                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 50,
                          color: focused ? Colors.red : Colors.grey));
                },
                children: 'abcdefghijklmnopqrstuvwxyz'
                    .codeUnits
                    .asMap()
                    .entries
                    .map((e) {
                  return Container(
                      color: e.key % 2 == 0 ? Colors.blue : Colors.yellow,
                      height: 30,
                      child: Text(
                          "${e.key} = ${e.value}/${String.fromCharCodes([
                            e.value
                          ])}"));
                }).toList())

                
          ],
        )),
      ),
    );
  }
}
