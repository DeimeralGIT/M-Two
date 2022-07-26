// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_two/core/colors.dart';
import 'package:m_two/core/numeric_params.dart';
import 'package:m_two/core/reusable_widgets/background/background_mobx.dart';

// Provides a background that animates when the logo icon is tapped on

class Background extends StatelessWidget {
  final backgroundMobx = BackgroundMobx();
  bool showIcon;
  Widget child;
  Background({
    Key? key,
    required this.showIcon,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBGColor,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          showIcon
              ? Positioned(
                  top: pageTopPadding,
                  left: pageSidePadding,
                  child: Observer(
                    builder: (_) => GestureDetector(
                      onTap: backgroundMobx.touchEnabled ? () => backgroundMobx.animate() : null,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 1500),
                        turns: backgroundMobx.turns,
                        curve: Curves.easeInOut,
                        onEnd: () => backgroundMobx.end(),
                        child: SizedBox(
                          height: logoIconWidgetSideLength,
                          width: logoIconWidgetSideLength,
                          child: Column(
                            children: [
                              Row(children: [IconDropWidget(pos: 0), IconDropWidget(pos: 1)]),
                              Row(children: [IconDropWidget(pos: 2), IconDropWidget(pos: 3)])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
            top: 250,
            left: -(MediaQuery.of(context).size.height / MediaQuery.of(context).size.width) * MediaQuery.of(context).size.height / 5.5,
            child: Observer(
              builder: (_) => AnimatedRotation(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1500),
                turns: -backgroundMobx.turns / 4,
                child: Transform(
                  transform: Matrix4.rotationZ(1.25),
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
          ),
          Positioned(
            top: pageTopPadding,
            height: MediaQuery.of(context).size.height - pageTopPadding,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                left: pageSidePadding,
                right: pageSidePadding,
                top: showIcon ? logoIconWidgetSideLength : 0,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

// "drop" widgets that make up the actual logo icon
class IconDropWidget extends StatelessWidget {
  int pos;
  IconDropWidget({Key? key, required this.pos}) : super(key: key);
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
