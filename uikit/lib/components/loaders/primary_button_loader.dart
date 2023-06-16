import 'package:flutter/material.dart';
import 'package:uikit/dimens/dimens.dart';

class PrimaryButtonLoader extends StatelessWidget {
  const PrimaryButtonLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      height: UIKitDimens.medium,
      width: UIKitDimens.medium,
    );
  }
}
