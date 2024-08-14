import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydb.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/pay.dart/pay.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class PersonDetailPage extends StatelessWidget {
  final Map<String, dynamic> person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Row(
          children: [
            SizedBox(
                width: 35), // Optional: Adjust the space from the left edge
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: person['image'] != null
                      ? NetworkImage(person['image'])
                      : null,
                  child: person['image'] == null
                      ? Text(
                          person['name'][0],
                          style: TextStyle(
                              fontSize: 24, color: ColorConstraints.mainbwhite),
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(width: 10), // Space between avatar and text
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person['name'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorConstraints.mainblack),
                  ),
                  Text(
                    person['phoneNumber'],
                    style: TextStyle(
                        fontSize: 14, color: ColorConstraints.lightgrey),
                  ),
                ],
              ),
            ),
            Spacer(), // Pushes the action icons to the right
            IconButton(
              icon: Icon(Icons.phone, color: ColorConstraints.mainblack),
              onPressed: () {
                // Implement your phone action here
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: ColorConstraints.mainblack),
              onPressed: () {
                // Implement your more actions here
              },
            ),
          ],
        ),
      
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Person details at the top center
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: person['image'] != null
                          ? NetworkImage(person['image'])
                          : null,
                      child: person['image'] == null
                          ? Text(
                              person['name'][0],
                              style: TextStyle(
                                  fontSize: 25,
                                  color: ColorConstraints.mainbwhite),
                            )
                          : null,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Banking Name: ${person['name']}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${person['phoneNumber']}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Joined ${person['joiningDate']}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                // Transaction list
                for (var transaction in Dummydbrecent.transactions)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: transaction['isPaidByOwner']
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment to ${person['name']}",
                                    style: TextStyle(
                                        color: ColorConstraints.mainblack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '\₹${transaction['amount']}',
                                    style: TextStyle(
                                        color: ColorConstraints.mainblack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 4, 73, 3),
                                        radius: 5,
                                        child: Icon(
                                          Icons.check,
                                          color: ColorConstraints.mainbwhite,
                                          size: 5,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Paid ",
                                        style: TextStyle(
                                          color: ColorConstraints.lightgrey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${transaction['date']}',
                                        style: TextStyle(
                                          color: ColorConstraints.lightgrey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              transaction['date'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Align children vertically in the center
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Pay(person:person)));
              },
              child: Text("Pay",
                  style: TextStyle(color: ColorConstraints.mainbwhite)),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstraints.Mainblue,
                minimumSize:
                    Size(0, 48), // Set a fixed height (48 is just an example)
                padding: EdgeInsets.symmetric(horizontal: 32),
              ),
            ),
            SizedBox(width: 16), // Space between buttons and text field
            ElevatedButton(
              onPressed: () {},
              child: Text("Request",
                  style: TextStyle(color: ColorConstraints.mainbwhite)),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstraints.Mainblue,
                minimumSize:
                    Size(0, 48), // Set a fixed height (48 is just an example)
                padding: EdgeInsets.symmetric(horizontal: 32),
              ),
            ),
            SizedBox(width: 16), // Space between buttons and text field
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: " Message...",
                  fillColor: const Color.fromARGB(255, 241, 236, 236),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12), // Adjust as needed
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none, // No border lines
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none, // No border lines when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none, // No border lines when enabled
                  ),
                  suffixIcon: Icon(Icons.send),
                ),
                keyboardType: TextInputType.text, // Match the "Message..." hint
              ),
            ),
          ],
        ),
      ),
    );
  }
}
