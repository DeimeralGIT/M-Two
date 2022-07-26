import 'package:flutter/material.dart';
import 'package:m_two/core/colors.dart';
import 'package:m_two/core/numeric_params.dart';
import 'package:m_two/core/reusable_widgets/background.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBGColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: pageSidePadding,
          right: pageSidePadding,
          top: pageTopPadding,
        ),
        child: Background(
          showIcon: true,
          child: SizedBox(),
        ),
      ),
    );
  }
}
