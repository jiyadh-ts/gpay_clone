import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/global_widgets/profilewidget.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class MobileRecharge extends StatelessWidget {
  const MobileRecharge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile recharge",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Icon(Icons.more_vert, size: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter a Phone number",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
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
                  Icon(
                    Icons.group,
                    color: ColorConstraints.Mainblue,
                    size: 44,
                  ),
                ],
              ),
              Text(
                "Ensure this is avalid phone number",
                style:
                    TextStyle(fontSize: 12, color: ColorConstraints.lightgrey),
              ),
              SizedBox(
                height: 20,
              ),
              profileswidget(
                title: "My recharges",
                list: Dummydbrecent.mobileRechargelist,
                secondaryImageVisible: true,
              ),
              profileswidget(
                title: "Mobile operators",
                list: Dummydbrecent.mobileOperatorlist,
              )
            ],
          ),
        ),
      ),
    );
  }
}
