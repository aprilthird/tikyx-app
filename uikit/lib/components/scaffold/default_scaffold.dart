import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../dimens/dimens.dart';
import '../../dimens/font_size.dart';
import '../../structs/menu_item.dart';
import '../buttons/grey_elevated_button.dart';
import '../buttons/primary_elevated_button.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold(
      {super.key,
      this.appTitle,
      this.menuItems,
      this.onTapMenuItem,
      this.onTapQuitButton,
      this.appBarColor,
      this.body});

  final Widget? appTitle;
  final List<MenuItem>? menuItems;
  final ValueChanged<MenuItem>? onTapMenuItem;
  final void Function()? onTapQuitButton;
  final Color? appBarColor;
  final Widget? body;

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: widget.appBarColor,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: widget.appTitle,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: UIKitDimens.medium,
                vertical: UIKitDimens.large,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menú principal',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: UIKitFontSize.large,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.25),
                      borderRadius:
                          BorderRadius.circular(UIKitDimens.extraLarge),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _key.currentState!.closeDrawer();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  if (widget.menuItems != null) ...[
                    for (var menuItem in widget.menuItems!) ...[
                      Divider(
                        height: 1,
                        color: Colors.grey.withOpacity(.25),
                      ),
                      ListTile(
                        title: Text(menuItem.title),
                        leading: Icon(menuItem.icon),
                        onTap: () {
                          widget.onTapMenuItem?.call(menuItem);
                          _key.currentState!.closeDrawer();
                        },
                      ),
                    ],
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(UIKitDimens.medium),
              child: Column(
                children: [
                  PrimaryElevatedButton(
                    minimumSize:
                        const Size.fromHeight(UIKitDimens.extraExtraLarge),
                    onPressed: () {
                      _key.currentState!.closeDrawer();
                      widget.onTapQuitButton?.call();
                    },
                    child: const Text('Cerrar sesión'),
                  ),
                  const SizedBox(
                    height: UIKitDimens.small,
                  ),
                  GreyElevatedButton(
                    minimumSize:
                        const Size.fromHeight(UIKitDimens.extraExtraLarge),
                    onPressed: () {
                      _key.currentState!.closeDrawer();
                      widget.onTapQuitButton?.call();
                    },
                    child: const Text('Términos y condiciones'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
