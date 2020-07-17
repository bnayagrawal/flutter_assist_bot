// Supports displaying image from url and one title

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';

class MediaCardCarouselAction implements IAction {
  final List<CardData> data;
  final Function(int) callback;

  MediaCardCarouselAction(this.data, this.callback);

  @override
  Widget render() {
    throw UnimplementedError();
  }
}

class CardData {
  final int id;
  final String title;
  final String imageUrl;

  CardData(this.id, {this.title, this.imageUrl});
}

class CardCarousel extends StatefulWidget {
  const CardCarousel({
    @required this.cards,
    @required this.callback,
    this.margin = const EdgeInsets.only(top: 8.0, bottom: 16),
    this.width = double.infinity,
  });

  final List<CardData> cards;
  final Function(int) callback;

  final EdgeInsets margin;
  final double width;

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  static const double WIDGET_HEIGHT = 240;

  static const int PAGE_CHANGE_ANIMATION_DURATION = 300;
  static const int BUTTON_COLOR_CHANGE_DURATION = 300;

  int _dropdownValue;
  int _selectedPageNumber;

  // Button state
  bool _leftButtonEnabled = false;
  bool _rightButtonEnabled = false;

  // Total pages(counted once)
  int _pageCount;

  PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController();
    _pageViewController.addListener(_onPageChange);

    // page count
    _pageCount = (widget.cards != null) ? widget.cards.length : 1;

    // selected page
    _selectedPageNumber = 1;
    _dropdownValue = 4;

    // Enable/Disable button
    if (widget.cards == null || widget.cards.isEmpty || widget.cards.length == 1)
      _leftButtonEnabled = _rightButtonEnabled = false;
    else if (widget.cards.length > 1) _rightButtonEnabled = true;

    super.initState();
  }

  // Shadow gradient to smoothly fade filters
  final Function _shaderCallback = (Rect rect) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: const <Color>[Colors.white, Colors.white, Colors.white, Colors.transparent],
    ).createShader(Rect.fromLTRB(0, rect.height, rect.width, 0));
  };

  void _onPageChange() {
    // Update pagination
    final double selectedPage = _pageViewController.page;
    // Check if number has decimal point.
    if (selectedPage % 1 == 0) {
      setState(() {
        // In page view the first page will be at index 0
        _selectedPageNumber = selectedPage.toInt() + 1;
        if (_selectedPageNumber > 3) _dropdownValue = _selectedPageNumber;

        // Update buttons
        if (_pageCount == 1) {
          // If there's only one page
          _leftButtonEnabled = _rightButtonEnabled = false;
        } else {
          if (_selectedPageNumber == _pageCount) {
            // If last page is active/displayed
            _leftButtonEnabled = true;
            _rightButtonEnabled = false;
          } else if (_selectedPageNumber == 1) {
            // If first page is active/displayed
            _leftButtonEnabled = false;
            if (_pageCount > 1) _rightButtonEnabled = true;
          } else {
            // If neither first nor last page is active/displayed
            _leftButtonEnabled = _rightButtonEnabled = true;
          }
        }
      });
    }
  }

  void _goToNextOrPreviousPage(bool nextPage) {
    final int goToPage = nextPage ? _selectedPageNumber + 1 : _selectedPageNumber - 1;
    if (goToPage > 0 && goToPage <= _pageCount) _onPageNumberClick(goToPage);
  }

  void _onPageNumberClick(int pageNumber) {
    // Change page
    _pageViewController.animateToPage(
      pageNumber - 1,
      duration: Duration(milliseconds: PAGE_CHANGE_ANIMATION_DURATION),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      _selectedPageNumber = pageNumber;
      if (_selectedPageNumber > 3) _dropdownValue = _selectedPageNumber;
    });
  }

  List<Widget> _buildPages() {
    final List<Widget> pages = <Widget>[];

    for(CardData data in widget.cards) {
      pages.add(GestureDetector(
        onTap: () => widget.callback(data.id),
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(data.imageUrl,height: 96),
              Text(data.title),
            ],
          ),
        ),
      ));
    }

    return pages;
  }

  List<Widget> _buildPageButtons() {
    final List<Widget> pageButtons = <Widget>[];

    // Add buttons(max 3)
    for (int pageNumber = 1; pageNumber <= _pageCount; pageNumber++) {
      // If there are more than 3 pages then break,
      if (pageNumber > 3) break;
      // Add button
      pageButtons.add(
        GestureDetector(
          onTap: () {
            // If this page is not selected
            if (pageNumber != _selectedPageNumber) _onPageNumberClick(pageNumber);
          },
          child: AnimatedContainer(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: BUTTON_COLOR_CHANGE_DURATION),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: pageNumber == _selectedPageNumber ? Colors.deepPurple : Colors.white,
              shape: BoxShape.circle,
              border:
              Border.all(color: pageNumber == _selectedPageNumber ? Colors.deepPurple : Colors.deepPurple[100]),
            ),
            child: Text(
              pageNumber.toString(),
              style: TextStyle(
                color: pageNumber == _selectedPageNumber ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }

    // If there are more than three buttons add dropdown.
    if (_pageCount > 3) {
      // Dropdown values
      final List<int> dropdownPageNumbers = List<int>.generate(_pageCount - 3, (int index) => index + 1 + 3);
      // Build dropdown
      pageButtons.add(
        Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white),
          child: AnimatedContainer(
            duration: Duration(milliseconds: BUTTON_COLOR_CHANGE_DURATION),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: const EdgeInsets.only(left: 8.0),
            margin: const EdgeInsets.only(left: 2.0),
            height: 28,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: _dropdownValue,
                isDense: true,
                onChanged: (int newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                    _onPageNumberClick(newValue);
                  });
                },
                items: dropdownPageNumbers.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
    }

    // Return the page buttons
    return pageButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: WIDGET_HEIGHT,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            blurRadius: 8,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      margin: widget.margin,
      child: Stack(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Left button
                AnimatedContainer(
                  duration: Duration(milliseconds: BUTTON_COLOR_CHANGE_DURATION),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: _leftButtonEnabled ? Colors.deepPurple : Colors.deepPurple[100],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: _leftButtonEnabled
                        ? () {
                      _goToNextOrPreviousPage(false);
                    }
                        : null,
                  ),
                ),
                // Pages and pagination
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Pages
                      Expanded(
                        child: ShaderMask(
                          shaderCallback: _shaderCallback,
                          blendMode: BlendMode.dstIn,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageViewController,
                            children: _buildPages(),
                          ),
                        ),
                      ),
                      // Pagination
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4.0,
                        children: _buildPageButtons(),
                      ),
                    ],
                  ),
                ),
                // Right button
                AnimatedContainer(
                  duration: Duration(milliseconds: BUTTON_COLOR_CHANGE_DURATION),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: _rightButtonEnabled ? Colors.deepPurple : Colors.deepPurple[100],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: _rightButtonEnabled
                        ? () {
                      _goToNextOrPreviousPage(true);
                    }
                        : null,
                  ),
                ),
              ],
            ),
          ),
          // Included label
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
            child: Text(
              'Powered by Spoonacular',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

