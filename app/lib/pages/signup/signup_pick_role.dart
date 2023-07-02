import 'package:app/pages/signup/signup_personal_data.dart';
import 'package:core/utils/seller.dart';
import 'package:domain/models/session.dart';
import 'package:domain/models/seller.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';

class SignupPickRolePage extends StatefulWidget {
  const SignupPickRolePage({
    super.key,
    required this.phoneNumber,
    required this.session,
  });

  final String phoneNumber;
  final Session session;

  @override
  State<SignupPickRolePage> createState() => _SignupPickRolePageState();
}

class _SignupPickRolePageState extends State<SignupPickRolePage> {
  String roleSelected = "";

  Widget selectedCheck() {
    return Align(
      alignment: Alignment.topRight,
      child: Icon(
        Icons.check_circle_rounded,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona una acción',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
                'Selecciona la opción que más se ajusta a tu requerimiento dentro de nuestra plataforma.'),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShadowCard(
                    onPressed: () {
                      setState(() {
                        roleSelected = SellerUtils.typeOwner;
                      });
                    },
                    borderColor: roleSelected == SellerUtils.typeOwner
                        ? Theme.of(context).primaryColor
                        : null,
                    child: Stack(
                      children: [
                        const Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/icon_role_vendor.png'),
                            ),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tengo mi puesto',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'Esta es una descripción corta de máximo 2 líneas.'),
                              ],
                            ),
                          ],
                        ),
                        if (roleSelected == SellerUtils.typeOwner) ...[
                          selectedCheck()
                        ],
                      ],
                    ),
                  ),
                  ShadowCard(
                    onPressed: () {
                      setState(() {
                        roleSelected = SellerUtils.typeReferral;
                      });
                    },
                    borderColor: roleSelected == SellerUtils.typeReferral
                        ? Theme.of(context).primaryColor
                        : null,
                    child: Stack(
                      children: [
                        const Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/icon_role_subscriber.png'),
                            ),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subscribirme a un puesto',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'Esta es una descripción corta de máximo 2 líneas.'),
                              ],
                            ),
                          ],
                        ),
                        if (roleSelected == SellerUtils.typeReferral) ...[
                          selectedCheck()
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () {
                if (roleSelected.isNotEmpty) {
                  goToSignupPersonalData();
                }
              },
              isFullWidth: true,
              child: Text(
                  roleSelected.isEmpty ? 'Selecciona una acción' : 'Continuar'),
            ),
          ],
        ),
      ),
    );
  }

  goToSignupPersonalData() async {
    final seller = Seller(
      name: "",
      userId: widget.session.user.id,
      genderId: 0,
      nationalityId: 0,
      workCity: "",
      type: roleSelected,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPersonalDataPage(
          session: widget.session,
          seller: seller,
        ),
      ),
    );
  }
}
