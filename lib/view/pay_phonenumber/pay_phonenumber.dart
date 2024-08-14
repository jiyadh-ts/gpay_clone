import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/global_widgets/profilewidget.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class PayPhonenumber extends StatelessWidget {
  const PayPhonenumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Icon(Icons.more_vert, size: 20),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter a Phone number",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    "Pay any",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: ColorConstraints.lightgrey),
                  ),
                  Text(
                    " UPI",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorConstraints.mainblack,
                        fontVariations: [
                          FontVariation('slnt', 40.0), // Adjust the angle as needed
                        ],
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    " app using phone number",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: ColorConstraints.lightgrey),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorConstraints.Mainblue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorConstraints.Mainblue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorConstraints.Mainblue,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            'https://th.bing.com/th/id/OIP.Ay8H_126zjIfNRE3MeBDuQHaHa?w=200&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        prefixText: '+91 ',
                        hintText: '00000 00000',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.group, color: ColorConstraints.Mainblue,size: 44,),
                ],
              ),
              profileswidget(
                title: "Recents",
                list: Dummydbrecent.recentpaylist,
              )
            ],
          ),
        ),
      ),
    );
  }
}
