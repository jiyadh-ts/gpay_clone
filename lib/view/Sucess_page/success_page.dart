import 'package:flutter/material.dart';
import 'package:gpay_clone/view/main_screen/main_screen.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class SuccessPage extends StatelessWidget {
  final String recipientName;
  final String amount;

  const SuccessPage(
      {super.key, required this.recipientName, required this.amount});

  String getCurrentDateTime() {
    DateTime now = DateTime.now();
    String day = now.day.toString();
    String month = _getMonthName(now.month);
    String year = now.year.toString();
    String hour =
        (now.hour > 12) ? (now.hour - 12).toString() : now.hour.toString();
    String minute = _addLeadingZero(now.minute);
    String period = (now.hour >= 12) ? "PM" : "AM";

    return "$day $month $year, $hour:$minute $period";
  }

  String _getMonthName(int monthNumber) {
    List<String> monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[monthNumber - 1];
  }

  String _addLeadingZero(int value) {
    return value < 10 ? '0$value' : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = getCurrentDateTime();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: ColorConstraints.Mainblue,
            child: Icon(
              Icons.check,
              color: ColorConstraints.mainbwhite,
              size: 45,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "₹$amount.00",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "paid to $recipientName",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "UPI ID: $recipientName@okaxis",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: ColorConstraints.lightgrey,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            formattedDateTime,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "UPI transaction ID: 7445739843",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: ColorConstraints.lightgrey,
            ),
          ),
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: ColorConstraints.Mainblue,
                ),
                label: Text(
                  "Share screenshot",
                  style: TextStyle(color: ColorConstraints.Mainblue),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstraints.mainbwhite,
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: ColorConstraints.mainbwhite),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstraints.Mainblue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
