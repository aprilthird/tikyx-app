import 'package:app/pages/onboarding/permissions.dart';
import 'package:app/pages/orders/order_code_validation.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class ComissionsDetailPage extends StatefulWidget {
  const ComissionsDetailPage({super.key});

  @override
  State<ComissionsDetailPage> createState() => _ComissionsDetailPageState();
}

class _ComissionsDetailPageState extends State<ComissionsDetailPage> {
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
                    'Detalle de la orden',
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
                        'Orden #289',
                        style: TextStyle(
                          fontSize: UIKitDimens.extraLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: UIKitDimens.medium,
                          ),
                          Text(
                            'Pendiente',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  ShadowCard(
                    child: Row(
                      children: [
                        const Image(
                          alignment: Alignment.center,
                          image:
                              AssetImage('../assets/images/image_user_1.png'),
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          children: [
                            Text(
                              'Tiana Bergson',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Socio afiliado')
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detalle de la comisión',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total: \$700',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  ShadowCard(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fecha:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('10 abril,2023')
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  ShadowCard(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Valor de la comisión:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('\$ 2543')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryElevatedButton(
                    onPressed: () {},
                    isFullWidth: true,
                    child: Text('Descargar comprobante'),
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
                      goBack();
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
}
