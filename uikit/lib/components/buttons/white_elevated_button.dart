import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../dimens/dimens.dart';

class WhiteElevatedButton extends StatelessWidget {
  const WhiteElevatedButton({
    super.key,
    this.child,
    this.onPressed,
    this.isFullWidth,
    this.minimumSize,
  });

  final void Function()? onPressed;
  final Size? minimumSize;
  final bool? isFullWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: isFullWidth ?? false
            ? const Size.fromHeight(UIKitDimens.extraExtraLarge)
            : minimumSize,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(UIKitDimens.small),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      child: child,
    );
  }
}
