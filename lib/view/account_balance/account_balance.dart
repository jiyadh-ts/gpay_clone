import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class AccountBalance extends StatelessWidget {
  final Map<String, dynamic> personDetails;

  const AccountBalance({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    final accountBalance = personDetails['BankAccountbalance'];
    final bankName = personDetails['Bankname'];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bank Balance:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '\₹ $accountBalance',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Savings account",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorConstraints.lightgrey),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              bankName,
              style: TextStyle(
                fontSize: 14,
                color: ColorConstraints.lightgrey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
