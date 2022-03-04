import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

import 'ripplelayout.dart';

typedef IndicatorBuild = Widget Function(PageController controller,bool focused, int index);

class GridPageView extends StatefulWidget {
  final List<Widget> children;
  final int column; //列数
  final int row; //行数
  final double columnSpacing; //列间隔
  final double rowSpacing; //行间隔
  final double itemRatio; //每个item的宽高比，默认正方形
  final double minheight;
  final IndicatorBuild? indicatorBuild;

  const GridPageView({
    Key? key,
    required this.children,
    this.column = 4,
    this.row = 2,
    this.columnSpacing = 0.0,
    this.rowSpacing = 0.0,
    this.itemRatio = 1.2,
    this.minheight = 200,
    this.indicatorBuild,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GridPageState();
  }
}

class GridPageState extends State<GridPageView> {
  ///每页的个数
  int _countPerPage = 0;

  ///总页数
  int _pageCount = 0;

  ///当前页
  int _currentPage = 0;

  ///控制器
  late PageController _controller;

  @override
  void initState() {
    _calculatePage();
    _controller = PageController();
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildPageView(),
        // ),
        _buildCursor(),
      ],
    );
  }

  @override
  void dispose() {
    //释放资源
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _calculatePage() {
    assert(widget.children != null);
    _countPerPage = widget.row * widget.column;
    _pageCount = (widget.children.length / _countPerPage).ceil();
  }

  Widget _buildGrid(List<Widget> list) {
    return Container(
        constraints: BoxConstraints(minHeight: widget.minheight),
        child: GridView.count(
          padding: EdgeInsets.zero, //解决空间高度多余问题。
          primary: false,
          scrollDirection: Axis.vertical,
          physics:
              const NeverScrollableScrollPhysics(), // 处理GridView中滑动父级SingleChildScrollView无法滑动
          crossAxisCount: widget.column,
          children: list,
          shrinkWrap: true,
          mainAxisSpacing: widget.rowSpacing,
          crossAxisSpacing: widget.columnSpacing,
          childAspectRatio: 1,
        ));
  }

  List<Widget> _buildPages() {
    List<Widget> list = [];
    int index = 0;
    int realIndex;
    for (int i = 0; i < _pageCount; i++) {
      realIndex = index + _countPerPage > widget.children.length
          ? widget.children.length
          : index + _countPerPage;
      List<Widget> widgetList = widget.children.sublist(index, realIndex);
      index = realIndex;
      list.add(_buildGrid(widgetList));
    }
    return list;
  }

  ///多个GridView构建PageView
  Widget _buildPageView() {
    return ExpandablePageView(
      controller: _controller,

      children: _buildPages(),
      // children: [Text("data"), Text("fff")], .._buildPages()
      onPageChanged: (page) {
        setState(() {
          _currentPage = page;
        });
      },
    );
  }

  ///页标
  Widget _buildCursor() {
    List<Widget> list = [];
    for (int i = 0; i < _pageCount; i++) {
      list.add(widget.indicatorBuild != null
          ? widget.indicatorBuild!(_controller,_currentPage == i, i)
          : _buildPoint(_currentPage == i, i));
    }
    return Container(
      child: Row(
        children: list,
        mainAxisSize: MainAxisSize.min,
      ),
      alignment: AlignmentDirectional.center,
    );
  }

  ///单个点
  Widget _buildPoint(bool focus, int i) {
    return MRippleLayout(
        btnColor: Colors.white,
        touchColor: Colors.red,
        rippleColor: Colors.yellowAccent,
        tapCallback: () {
          // Utils.showToast("you click me $i");
          setState(() {
            _currentPage = i;
          });

          _controller.animateToPage(i,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: 10, height: 10, color: focus ? Colors.black : Colors.grey),
        ));
  }
}
