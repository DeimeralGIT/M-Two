import 'package:flutter/cupertino.dart';
import 'package:m_two/core/colors.dart';
import 'package:m_two/core/numeric_params.dart';

// Provides a background that animates when the logo icon is tapped on

class Background extends StatefulWidget {
  Widget child;
  bool showIcon; // if set to false - the logo icon will not be drawn and there will not be animations
  Background({required this.child, required this.showIcon});
  @override
  State<StatefulWidget> createState() => BackgroundState();
}

class BackgroundState extends State<Background> {
  late bool touchEnabled; //ensure to enable touch only when there is no ongoing animation
  double turns = 0;

  @override
  void initState() {
    touchEnabled = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.showIcon
            ? GestureDetector(
                onTap: touchEnabled
                    ? () {
                        setState(() {
                          turns += 3;
                          touchEnabled = false;
                        });
                      }
                    : null,
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 1500),
                  turns: turns,
                  curve: Curves.easeInOut,
                  onEnd: () {
                    setState(() {
                      touchEnabled = true;
                    });
                  },
                  child: SizedBox(
                    height: logoIconWidgetSideLength,
                    width: logoIconWidgetSideLength,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconDropWidget(pos: 0),
                            IconDropWidget(pos: 1),
                          ],
                        ),
                        Row(
                          children: [
                            IconDropWidget(pos: 2),
                            IconDropWidget(pos: 3),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Positioned(
          top: 250,
          left: -(MediaQuery.of(context).size.height / MediaQuery.of(context).size.width) * MediaQuery.of(context).size.height / 5.5,
          child: AnimatedRotation(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1500),
            turns: turns / 4,
            child: Transform(
              transform: Matrix4.rotationZ(1.2),
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: backGroundCardColor,
                  borderRadius: BorderRadius.circular(110),
                ),
              ),
            ),
          ),
        ),
        Positioned(top: appbar, child: widget.child),
      ],
    );
  }
}

// drop widgets that make up the actual logo icon
class IconDropWidget extends StatelessWidget {
  int pos;
  IconDropWidget({required this.pos});
  @override
  Widget build(BuildContext context) {
    Radius cornerRadius = const Radius.circular(50);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: pos != 0 ? cornerRadius : Radius.zero,
          topLeft: pos != 1 ? cornerRadius : Radius.zero,
          bottomRight: pos != 2 ? cornerRadius : Radius.zero,
          topRight: pos != 3 ? cornerRadius : Radius.zero,
        ),
        border: Border.all(),
        color: logoIconWidgetColor,
      ),
      height: logoIconWidgetSideLength / 2,
      width: logoIconWidgetSideLength / 2,
    );
  }
}
