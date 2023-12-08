import 'package:flutter/material.dart';

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({super.key});

  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton>
    with SingleTickerProviderStateMixin {
  final List<bool> _isSelected = [true, false];
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => ToggleButtons(
        color: Colors.black,
        fillColor: _animation.value,
        isSelected: _isSelected,
        onPressed: (index) {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = i == index;
            }
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          });
        },
        children: const [
          Icon(Icons.ac_unit),
          Icon(Icons.fireplace),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
