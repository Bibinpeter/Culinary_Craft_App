import 'package:flutter/material.dart';
import 'package:prj1/userhome/user_page1.dart';
import 'package:prj1/userhome/userp2.dart';
import 'package:prj1/userhome/userp4.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> { 
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          UserPage1(),
          usesP2(),
      
          userP4(),
        ],
      ),
      bottomNavigationBar: BounceTabBar(
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        items: const [
          Icon(
            Icons.home,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.bookmark_added,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.category,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.person,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}

const _movement = 100.0;

class BounceTabBar extends StatefulWidget {
  const BounceTabBar({
    Key? key,
    this.backgroundColor = const Color.fromARGB(255, 0, 0, 0),
    required this.items,
    required this.onTabChanged,
    this.initialIndex = 0,
  }) : super(key: key);
  final Color backgroundColor;
  final List<Widget> items;
  final ValueChanged<int> onTabChanged;
  final int initialIndex;

  @override
  State<BounceTabBar> createState() => _BounceTabBarState();
}

class _BounceTabBarState extends State<BounceTabBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animTabBarIn;
  late Animation<double> _animTabBarOut;
  late Animation<double> _animCircleItem;
  late Animation<double> _animElevationIn;
  late Animation<double> _animElevationOut;
  late AnimationController _controller = AnimationController(vsync: this);

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    _animTabBarIn =
        CurveTween(curve: const Interval(0.3, 0.5, curve: Curves.decelerate))
            .animate(_controller);

    _animTabBarOut =
        CurveTween(curve: const Interval(0.6, 1.0, curve: Curves.bounceOut))
            .animate(_controller);

    _animCircleItem =
        CurveTween(curve: const Interval(0.0, 0.5, curve: Curves.bounceOut))
            .animate(_controller);

    _animElevationIn =
        CurveTween(curve: const Interval(0.3, 0.5, curve: Curves.decelerate))
            .animate(_controller);

    _animElevationOut =
        CurveTween(curve: const Interval(0.5, 1.0, curve: Curves.bounceOut))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final currentWidth = width -
              (_movement * _animTabBarIn.value) +
              (_movement * _animTabBarOut.value);
          final currentElevation = -_movement * _animElevationIn.value +
              (_movement - kBottomNavigationBarHeight / 4) *
                  _animElevationOut.value;
          return Center(
            child: Container(
              width: currentWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(widget.items.length, (index) {
                  final child = widget.items[index];
                  final buttonRadius = 28.0;
                  final innerWidget = CircleAvatar(
                    radius: buttonRadius,
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: child,
                  );
                  if (index == _currentIndex) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _controller.forward(from: 0.0);
                        },
                        child: CustomPaint(
                          foregroundPainter:
                              _CircleItemPainter(_animCircleItem.value),
                          child: Transform.translate(
                            offset: Offset(2.0, currentElevation),
                            child: innerWidget,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget.onTabChanged(index);
                          setState(() {
                            _currentIndex = index;
                          });
                          _controller.forward(from: 0.0);
                        },
                        child: innerWidget,
                      ),
                    );
                  }
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CircleItemPainter extends CustomPainter {
  final double progress;
  _CircleItemPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // ignore: non_constant_identifier_names
    final Center = Offset(size.width / 2, size.height / 2);
    final radius = 20.0 * progress;
    const strokewidth = 10.0;
    final currentStrokeWidth = strokewidth * (1 - progress);
    if (progress < 1.0) {
      canvas.drawCircle(
          Center,
          radius,
          Paint()
            ..color = Color.fromARGB(255, 35, 124, 176)
            ..style = PaintingStyle.stroke
            ..strokeWidth = currentStrokeWidth);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
