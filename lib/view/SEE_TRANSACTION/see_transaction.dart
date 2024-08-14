import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class SeeTransaction extends StatelessWidget {
  SeeTransaction({super.key});

  final List<String> filter = [
    "Status",
    "Payment method",
    "Date",
    "Amount",
    "Payment Type"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorConstraints.mainblack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search Transactions",
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
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.more_vert),
          ),
          Icon(Icons.tune, color: ColorConstraints.mainblack),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(
                filter.length,
                (index) => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorConstraints.mainblack),
                  ),
                  child: Text(filter[index]),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(), // Add your body content here
    );
  }
}
