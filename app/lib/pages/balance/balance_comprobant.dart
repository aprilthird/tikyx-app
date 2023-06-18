import 'package:app/pages/balance/balance_comprobant_detail.dart';
import 'package:app/pages/balance/balance_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/dimens/font_size.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class BalanceComprobantPage extends StatefulWidget {
  const BalanceComprobantPage({super.key});

  @override
  State<BalanceComprobantPage> createState() => _BalanceComprobantPageState();
}

class _BalanceComprobantPageState extends State<BalanceComprobantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comprobante',
                    style: TextStyle(
                      fontSize: UIKitDimens.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Proporciona una foto clara del comprobate para verificar \nel deposito de saldo',
                        style: TextStyle(
                          fontSize: UIKitDimens.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  ShadowCard(
                    backgroundColor: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          alignment: Alignment.center,
                          image: AssetImage('../assets/images/comprobant.png'),
                          height: 300,
                          width: 250,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Theme.of(context).primaryColor,
                        size: 30.0,
                      ),
                      Text("Tomar o Subir una foto")
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryElevatedButton(
                    onPressed: () {
                      goToBalanceComprobantDetail();
                    },
                    isFullWidth: true,
                    child: Text('Enviar Comprobante'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: UIKitDimens.small,
            ),
            Row(
              children: [
                Expanded(
                  child: GreyElevatedButton(
                    onPressed: () {
                      goToBalanceDetail();
                    },
                    isFullWidth: true,
                    child: Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }

  goToBalanceComprobantDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BalanceComprobantDetailPage(),
      ),
    );
  }

  goToBalanceDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BalanceDetailPage(),
      ),
    );
  }
}
