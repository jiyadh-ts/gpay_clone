import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydb.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/global_widgets/circle_avatar_new.dart';
import 'package:gpay_clone/view/global_widgets/profilewidget.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class ElectricityBill extends StatelessWidget {
  const ElectricityBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Flexible(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.search, color: ColorConstraints.mainblack),
                  onPressed: () {},
                ),
                hintText: "Search Suppliers",
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
              Text(
                "Select your electricity supplier",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              profileswidgetNew(
                title: "Suggested",
                list: Dummydb.Electricityprovider,
              ),
              profileswidgetNew(
                title: "All",
                list:Dummydb.AllElectricityprovider,
              )
            ],
          ),
        ),
      ),
    );
  }
}
