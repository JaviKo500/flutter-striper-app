import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/blocs/pay/pay_bloc.dart';

import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/services/stripe_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Stripe service init
    StripeService().init();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => PayBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': ( _ ) => HomePage(),
          '/complete_pay': ( _ ) => const FullPayment(),
        },
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xff284879),
          scaffoldBackgroundColor: const Color(0xff21232A)
        ),
      ),
    );
  }
}