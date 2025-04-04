import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Background for NavigationPage
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Navigation Page',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 20),
          HoverButton(
            imagePath: 'images/mercury.png',
            height: 60,
            onPressed: () {
              Navigator.pushNamed(context, '/mercury');
            },
          ),
          HoverButton(
            imagePath: 'images/venus.png',
            height: 70,
            onPressed: () {
              Navigator.pushNamed(context, '/venus');
            },
          ),
          HoverButton(
            imagePath: 'images/earth.png',
            height: 90,
            onPressed: () {
              Navigator.pushNamed(context, '/earth');
            },
          ),
          HoverButton(
            imagePath: 'images/mars.png',
            height: 50,
            onPressed: () {
              Navigator.pushNamed(context, '/mars');
            },
          ),
          HoverButton(
            imagePath: 'images/jupiter.jpg',
            height: 150,
            onPressed: () {
              Navigator.pushNamed(context, '/jupiter');
            },
          ),
          HoverButton(
            imagePath: 'images/saturn.png',
            height: 120,
            onPressed: () {
              Navigator.pushNamed(context, '/saturn');
            },
          ),
          HoverButton(
            imagePath: 'images/uranus.png',
            height: 110,
            onPressed: () {
              Navigator.pushNamed(context, '/uranus');
            },
          ),
          HoverButton(
            imagePath: 'images/neptune.png',
            height: 110,
            onPressed: () {
              Navigator.pushNamed(context, '/neptune');
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String imagePath;
  final double height;
  final VoidCallback onPressed;

  const HoverButton({
    super.key,
    required this.imagePath,
    required this.height,
    required this.onPressed,
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedScale(
            scale: _isHovered ? 1.1 : 1.0, //pop out when hover
            duration: Duration(milliseconds: 200),
            child: Image.asset(widget.imagePath, height: widget.height),
          ),
        ),
      ),
    );
  }
}
