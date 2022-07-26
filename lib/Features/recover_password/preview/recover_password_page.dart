import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_two/Features/recover_password/manager/recover_password_mobx.dart';
import 'package:m_two/Features/recover_password/preview/widgets/send_recovery_code_section.dart';
import 'package:m_two/Features/recover_password/preview/widgets/verify_recovery_code_section.dart';
import 'package:m_two/core/reusable_widgets/background/background.dart';

class RecoverPasswordPage extends StatelessWidget {
  final RecoverPasswordMobx recoverPasswordMobx = RecoverPasswordMobx();
  RecoverPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background(
      showIcon: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Observer(
              builder: (_) => AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                  child: !recoverPasswordMobx.emailSent
                      ? SendRecoveryCodeSection(
                          manager: recoverPasswordMobx,
                        )
                      : VerifyRecoveryCodeSection(
                          manager: recoverPasswordMobx,
                        ),
                ),
              ),
            ),
            const Spacer(),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
