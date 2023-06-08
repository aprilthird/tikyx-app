import 'package:flutter/material.dart';

import '../../dimens/dimens.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({
    super.key,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.paddingValue,
    this.borderRadiusValue,
    this.noShadow,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final double? paddingValue;
  final double? borderRadiusValue;
  final bool? noShadow;
  final Widget? child;

  Widget content() {
    return Padding(
      padding: EdgeInsets.all(paddingValue ?? UIKitDimens.medium),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius:
            BorderRadius.circular(borderRadiusValue ?? UIKitDimens.medium),
        boxShadow: noShadow ?? false
            ? []
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: onPressed == null
          ? content()
          : Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(
                    borderRadiusValue ?? UIKitDimens.medium),
                child: content(),
              ),
            ),
    );
  }
}
