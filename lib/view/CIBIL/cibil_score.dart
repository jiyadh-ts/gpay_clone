import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class CibilScore extends StatelessWidget {
  const CibilScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ),
        title: Text("Your basic details"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CIBIL will use this information to get your score",
              style: TextStyle(fontSize: 16, color: ColorConstraints.lightgrey),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 233, 246, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.verified_user,
                          color: ColorConstraints.darkgreen),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+91 7736785970",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            "your number in Google pay",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: ColorConstraints.lightgrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "FirstName",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: ColorConstraints.Mainblue),
                ),
              ),
            ),
            SizedBox(height: 2),
            Text(
              "as per PAN card",
              style: TextStyle(fontSize: 12, color: ColorConstraints.lightgrey),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "LastName",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: ColorConstraints.Mainblue),
                ),
              ),
            ),
            SizedBox(height: 2),
            Text(
              "as per PAN card",
              style: TextStyle(fontSize: 12, color: ColorConstraints.lightgrey),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box,
                  color: ColorConstraints.Mainblue,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text:
                          "I authorize Google Pay to securely transmit my information to the relevant financial institutions for verification purposes. This consent allows for the processing and sharing of my data in compliance with applicable laws and regulations. ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Learn more",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorConstraints.Mainblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConstraints.Mainblue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
