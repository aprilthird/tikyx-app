import 'package:flutter/material.dart';

import '../../dimens/dimens.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
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
      onPressed: () {
        onPressed?.call();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: isFullWidth ?? false
            ? const Size.fromHeight(UIKitDimens.extraExtraLarge)
            : minimumSize,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(UIKitDimens.small),
          ),
        ),
        padding: const EdgeInsets.all(UIKitDimens.medium),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      child: child,
    );
  }
}
