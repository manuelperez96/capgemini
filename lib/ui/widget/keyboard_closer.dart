import 'package:flutter/material.dart';

/// Close keyboard when user click in a non-interactive
/// zone of the screen
class KeyboardCloser extends StatelessWidget {
  const KeyboardCloser({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => hideKeyboard(context),
      child: child,
    );
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
