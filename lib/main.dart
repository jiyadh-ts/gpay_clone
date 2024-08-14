import 'package:flutter/material.dart';
import 'package:gpay_clone/view/DTH/dth_cable_recharge.dart';
import 'package:gpay_clone/view/Electricity_bill/electricity_bill.dart';
import 'package:gpay_clone/view/Mobile_Recharge/mobile_recharge.dart';
import 'package:gpay_clone/view/splash_screen/splash_screen.dart';

// Import other necessary pages here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/mobileRecharge': (context) => MobileRecharge(),
        '/dthRecharge': (context) => DthCableRecharge(),
         '/electricityBill':(context) =>ElectricityBill(),
        
        
      },
    );
  }
}
