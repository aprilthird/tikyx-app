import 'package:app/pages/onboarding/permissions_page.dart';
import 'package:app/pages/orders/order_code_validation.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/dimens/font_size.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
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
                            'Impaga',
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
                        'Detalle del pedido',
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
                        const Image(
                          alignment: Alignment.center,
                          image: AssetImage(
                              '../assets/images/image_product_1.png'),
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Paquete x3 de galletitas Oreo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Precio: \$300.00')
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
                        const Image(
                          alignment: Alignment.center,
                          image: AssetImage(
                              '../assets/images/image_product_2.png'),
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'La serenísima bebida de almendra',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Precio: \$ 400.00')
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
                    onPressed: () {
                      goToOrderCodeValidation();
                    },
                    isFullWidth: true,
                    child: Text('Entregar'),
                  ),
                ),
                const SizedBox(
                  width: UIKitDimens.medium,
                ),
                Expanded(
                  child: GreyElevatedButton(
                    onPressed: () {},
                    isFullWidth: true,
                    child: Text('En efectivo'),
                  ),
                ),
                const SizedBox(
                  width: UIKitDimens.medium,
                ),
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

  goToOrderCodeValidation() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderCodeValidationPage(),
      ),
    );
  }
}
