import 'package:flutter/material.dart';
import 'package:gpay_clone/view/main_screen/main_screen.dart';
import 'package:gpay_clone/view/util/imageconstaints.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 127.69,
                width: 149.71,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Imageconstaints.GpayLogo),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 48.99,
            width: 150.05,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Imageconstaints.Google),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
