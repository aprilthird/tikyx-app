import 'package:app/pages/balance/balance.dart';
import 'package:app/pages/commissions/comissions.dart';
import 'package:app/pages/onboarding/on_boarding.dart';
import 'package:app/pages/orders/orders_summary.dart';
import 'package:app/pages/packing/packing.dart';
import 'package:app/pages/referrals/referrals.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/pages/usersettings/user_settings.dart';
import 'package:data/repositories/auth.dart';
import 'package:data/repositories/seller.dart';
import 'package:domain/models/seller.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/scaffold/default_scaffold.dart';
import 'package:uikit/structs/menu_item.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key});

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  var currentTitle = '';
  var currentId = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    var menuItems = [
      MenuItem(id: 0, title: 'Ordenes', icon: Icons.edit_document),
      MenuItem(id: 1, title: 'Balance', icon: Icons.stacked_line_chart),
      MenuItem(id: 2, title: 'Referidos', icon: Icons.person_add),
      MenuItem(id: 3, title: 'Comisiones', icon: Icons.wallet),
      MenuItem(id: 4, title: 'Paquetería', icon: Icons.local_shipping),
      MenuItem(id: 5, title: 'Configuración', icon: Icons.settings),
      MenuItem(id: 6, title: 'Datos', icon: Icons.verified_user_sharp),
    ];

    return DefaultScaffold(
      appTitle: Text(currentTitle),
      appBarColor: Theme.of(context).scaffoldBackgroundColor,
      menuItems: menuItems,
      onTapMenuItem: (menuItem) {
        setState(() {
          currentId = menuItem.id;
          currentTitle = menuItem.title;
        });
      },
      onTapQuitButton: () {
        goToOnBoarding();
      },
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: Future.wait([
              AuthRepository.getCurrentSession(),
              SellerRepository.getCurrentSeller()
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var session = snapshot.requireData[0] as Session;
                var seller = snapshot.requireData[1] as Seller;
                return currentPage(session, seller);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget currentPage(Session session, Seller seller) {
    switch (currentId) {
      case 0:
        return OrdersSummaryPage(session: session, seller: seller);
      case 1:
        return const BalancePage();
      case 2:
        return const ReferralsPage();
      case 3:
        return const CommissionsPage();
      case 4:
        return const PackingPage();
      case 5:
        return SettingsPage(session: session, seller: seller);
      case 6:
        return const UserSettingsPage();
      default:
        return OrdersSummaryPage(session: session, seller: seller);
    }
  }

  goToOnBoarding() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingPage(),
      ),
    );
  }
}
