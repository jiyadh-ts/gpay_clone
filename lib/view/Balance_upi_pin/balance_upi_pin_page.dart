import 'package:flutter/material.dart';
import 'package:gpay_clone/view/account_balance/account_balance.dart';
import 'package:gpay_clone/view/dummydb.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class BalanceUpiPage extends StatefulWidget {
  const BalanceUpiPage({
    super.key,
  });

  @override
  State<BalanceUpiPage> createState() => _BalanceUpiPageState();
}

class _BalanceUpiPageState extends State<BalanceUpiPage> {
  String getMaskedAccountNumber(String accountNumber) {
    return 'XXXXXX${accountNumber.substring(accountNumber.length - 4)}';
  }

  final List<TextEditingController> _pinControllers =
      List.generate(6, (index) => TextEditingController());

  void _checkPin() {
    String enteredPin =
        _pinControllers.map((controller) => controller.text).join('');
    String correctPin = Dummydb.Userdata["UPIPIN"].toString();

    if (enteredPin == correctPin) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AccountBalance(personDetails: Dummydb.Userdata)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Incorrect PIN. Please try again."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String bankName = Dummydb.Userdata["Bankname"];
    String accountNumber =
        getMaskedAccountNumber(Dummydb.Userdata["Bankaccountnumber"]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bankName,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              accountNumber,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://th.bing.com/th?id=OIP.lDrTXJFcFI89ozyh4dGYhwHaDX&w=349&h=159&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: ColorConstraints.lightgrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        accountNumber,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Enter 6-DIGIT UPI PIN",
                      style: TextStyle(
                          color: ColorConstraints.lightgrey, fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SizedBox(
                          width: 40,
                          child: TextField(
                            controller: _pinControllers[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            obscureText: true,
                            decoration: InputDecoration(
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSubmitted: (value) {
                              if (index == 5) {
                                _checkPin();
                              }
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "  UPI PIN will keep your account secure from\nunauthorized acces. Do not share this PIN with\n                             anyone",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstraints.lightgrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
