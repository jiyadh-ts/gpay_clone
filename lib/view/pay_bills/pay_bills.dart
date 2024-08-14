import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/global_widgets/icon_cards.dart';
import 'package:gpay_clone/view/pay_bills/bills_profile_widget.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class PayBills extends StatelessWidget {
  const PayBills({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            BillsProfileWidget(
          title: "Your Checklist (3)",
          list: Dummydbrecent.checklistlist,
        ),
        SizedBox(height: 10,),
        IconCards(title: "Payment categories", items: Dummydbrecent.paymentCategoryList),
        SizedBox(height: 20,),
        Container(
          height: 50,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: ColorConstraints.mainblack)
                ),
                child: Center(
                  child: Text(
                    'View all',
                    style: TextStyle(color: ColorConstraints.Mainblue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                                ),
                ),
        )
              
            ],
          ),
        ),
      ),
    );
  }
}