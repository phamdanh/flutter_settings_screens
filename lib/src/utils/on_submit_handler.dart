import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnSubmitHandler extends StatelessWidget {
  final Widget child;
  final Function? onFocused;
  const OnSubmitHandler({Key? key, required this.child, this.onFocused}) : super(key: key);

  KeyEventResult _onKeyHandler(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyUpEvent && event.logicalKey == LogicalKeyboardKey.select) {
      onSubmit(child);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void onSubmit(var child) {
    if (child is GestureDetector) {
      child.onTap?.call();
      return;
    }
    if (child is InkWell) {
      child.onTap?.call();
      return;
    }
    if (child is ListTile) {
      child.onTap?.call();
      return;
    }
    if (child is ButtonStyleButton) {
      child.onPressed?.call();
      return;
    }
    if (child is IconButton) {
      child.onPressed?.call();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if(focused) onFocused?.call();
      },
      onKey: _onKeyHandler,
      child: child,
    );
  }
}
