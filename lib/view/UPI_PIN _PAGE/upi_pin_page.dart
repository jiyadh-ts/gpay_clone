import 'package:flutter/material.dart';
import 'package:gpay_clone/view/Sucess_page/success_page.dart';
import 'package:gpay_clone/view/dummydb.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/paying_splash_screen/pay_splash_screen.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class UpiPinPage extends StatefulWidget {
  final String recipientName;
  final String amount;

  const UpiPinPage(
      {super.key, required this.recipientName, required this.amount});

  @override
  State<UpiPinPage> createState() => _UpiPinPageState();
}

class _UpiPinPageState extends State<UpiPinPage> {
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
            builder: (context) => PaySplashScreen(
                recipientName: widget.recipientName, amount: widget.amount)),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "To :",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Sending :",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.recipientName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹${widget.amount}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
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
                            obscureText: true, // Masks the input
                            decoration: InputDecoration(
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                // Move to the next TextField
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
                    height: 50,
                  ),
                  Container(
                    height: 38,
                    width: 280,
                    decoration: BoxDecoration(
                        color: ColorConstraints.lightyellow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: ColorConstraints.darkyellow,
                            child: Icon(
                              Icons.priority_high,
                              size: 14,
                              color: ColorConstraints.mainbwhite,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "you are transferring money from your account to",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                widget.recipientName,
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
