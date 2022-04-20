import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text( 'Pay' )),
        actions: [
          IconButton(
            icon: const Icon( Icons.add ),
            onPressed: () async {
              // showLoading(context);
              // await Future.delayed( const Duration( seconds: 1 ) );
              // Navigator.pop(context);
              showAlert(context, 'hello', 'world');
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: cards.length,
              itemBuilder: ( _, i ) {
                final card = cards[i];
                return GestureDetector(
                  child: Hero(
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
                  onTap: () {
                    Navigator.push(context, navigationFadeIn(context, const CardPage()));
                  },
                );
              } ,
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