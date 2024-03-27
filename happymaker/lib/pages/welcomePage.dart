import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _textList = [
    "Welcome to Our App",
    "Stay Connected",
    "Get Started",
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topForLogoText = MediaQuery.of(context).size.height * 0.4;
    if (_currentPage > 0) {
      topForLogoText = MediaQuery.of(context).size.height * 0.2;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/mountain1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _textList.length,
            itemBuilder: (_, index) => const SizedBox.shrink(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: topForLogoText,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset('lib/images/logo.png', width: 100),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Text(
                    _textList[_currentPage],
                    key: ValueKey<int>(_currentPage),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: _currentPage != _textList.length - 1
                  ? FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                      },
                      child: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        // Insert your navigation logic here
                      },
                      style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.white),
                      child: const Text("Continue"),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
