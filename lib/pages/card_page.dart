import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/models/credit_card_custom.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';


class CardPage extends StatelessWidget {

  const CardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final  card = CreditCardCustom(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Fernando Herrera'
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Pay' ),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: card.cardNumber,
            child: CreditCardWidget(
              cardNumber: card.cardNumberHidden, 
              expiryDate: card.expiracyDate, 
              cardHolderName: card.cardHolderName, 
              cvvCode: card.cvv, 
              showBackView: false, 
              onCreditCardWidgetChange: ( CreditCardBrand ) {},
            ),
          ),
          const Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      )
   );
  }
}