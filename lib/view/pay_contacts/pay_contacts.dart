import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/global_widgets/profilewidget.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class PayContacts extends StatelessWidget {
  const PayContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Flexible(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon:
                      Icon(Icons.arrow_back, color: ColorConstraints.mainblack),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                hintText: "Pay anyone on UPI",
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorConstraints.mainblack),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorConstraints.mainblack),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorConstraints.mainblack),
                )),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileswidget(
              title: "Recent",
              list: Dummydbrecent.recentpaylist,
            
            ),
            SizedBox(height: 20,),
             profileswidget(
              title: "All people on UPI",
              list: Dummydbrecent.recentpaylist,
              isvisible: true,
            
            ),

          ],
        ),
      ),
  

    );
  }
}


