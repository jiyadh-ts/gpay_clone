import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class SelfTransfer extends StatelessWidget {
  const SelfTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:   AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Icon(Icons.more_vert, size: 20),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Enter UPI ID or number",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 45,),
              Text(
                "Manage your money better by adding another  ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: ColorConstraints.lightgrey),
              ),
               Text(
                "account to make self transfers ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: ColorConstraints.lightgrey),
              ),
              SizedBox(height :30),
             Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   
                     Container(
                      height: 45,
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstraints.lightgrey),
                        borderRadius: BorderRadius.circular(5)
                      ),
                       child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.SALp5MP-n4R837zjAQlniwHaHa?w=144&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                          ),
                     ),
                    
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "State Bank of India****3271",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Savings account",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   
                     Container(
                      height: 45,
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstraints.Mainblue),
                        borderRadius: BorderRadius.circular(5)
                      ),
                       child: Center(
                      
                            child: Icon(Icons.account_balance_outlined,size: 24,color: ColorConstraints.Mainblue,),
                          ),
                     ),
                    
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add bank account",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,color: ColorConstraints.Mainblue),
                          ),
                         
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                 
          ],
        ),
      ),
    );
  }
}