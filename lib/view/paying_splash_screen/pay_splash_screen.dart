import 'package:flutter/material.dart';
import 'package:gpay_clone/view/Sucess_page/success_page.dart';
import 'package:lottie/lottie.dart';

class PaySplashScreen extends StatefulWidget {
  final String recipientName;
  final String amount;

  const PaySplashScreen({
    super.key,
    required this.recipientName,
    required this.amount,
  });

  @override
  State<PaySplashScreen> createState() => _PaySplashScreenState();
}

class _PaySplashScreenState extends State<PaySplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessPage(
            recipientName: widget.recipientName,
            amount: widget.amount,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Lottie.asset(
            'asset/animations/Animation - 1723526484854.json',
            repeat: false
          ),
        ),
      ),
    );
  }
}
