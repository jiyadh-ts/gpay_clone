import 'package:flutter/material.dart';
import 'package:gpay_clone/view/dummydbrecent.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class BillsProfileWidget extends StatelessWidget {
  const BillsProfileWidget({
    this.title = "",
    super.key, 
    required this.list, 
    this.isvisible = false,
  });

  final String title;
  final List list;
  final bool isvisible;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 20, 
                color: ColorConstraints.mainblack,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Visibility(
              visible: isvisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 27,
                    child: Icon(Icons.group_add_outlined, size: 24),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Group",
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "start group chat or split an expense",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                if (index < Dummydbrecent.checklistlist.length) {
                  final chat = list[index];
                  return Container(
                    padding: EdgeInsets.all(5),
                    height: 80, // Adjusted height to accommodate additional text
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(chat["image"]),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundImage: NetworkImage(chat["Secondaryimage"]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat["name"],
                              style: TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              chat["number"],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              chat["rechargeNo"],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstraints.lightgrey
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.add,color: ColorConstraints.Mainblue,size: 16,),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "Add bills,recharges and more!",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConstraints.Mainblue, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Mobile,electricity,Dth<LPG and more",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 2),
                        ],
                      ),
                      Spacer(),
                    ],
                  );
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: list.length+1,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
