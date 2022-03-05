<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 





-->

Automatically wrap the content, produce the height according to the content, and support page turning custom indicator


Pageview is unable to adapt to the height of the content, and this control solves this problem, the effect of this control as shown in the picture, support to set the minimum height, in order to solve the problem of the height of each page caused by different height, in addition to support custom indicators,  
pageview 是无法自适应内容高度的，而本控件解决了这个问题，本控件的效果如 图片所示，支持设置最小高度，以便解决每一页高度不同导致的高度跳动问题，另外也支持自定义指示器，
## Features
y
 ![this ispic ](example/assets/pic.png)


## Getting started

GridPageView(  column: 5,
                minheight: 0,
                row: 2,    children: [] )
## Usage

```


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

                

```


or 

If you don't need custom indicators, you can do so using the following code  
```

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
                }).toList())


 ```               



```dart
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
                }).toList())

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.








# grid pageview

Automatically wrap the content, produce the height according to the content, and support page turning custom indicator


Pageview is unable to adapt to the height of the content, and this control solves this problem, the effect of this control as shown in the picture, support to set the minimum height, in order to solve the problem of the height of each page caused by different height, in addition to support custom indicators,  
pageview 是无法自适应内容高度的，而本控件解决了这个问题，本控件的效果如 图片所示，支持设置最小高度，以便解决每一页高度不同导致的高度跳动问题，另外也支持自定义指示器，
## Getting Started



 # publish note


 ```
set https_proxy=https://127.0.0.1:1079
set http_proxy=http://127.0.0.1:1079
flutter pub publish --dry-run
flutter packages pub publish -v
flutter pub publish --server=https://pub.dartlang.org
flutter packages pub publish --server=https://pub.dartlang.org
 ```