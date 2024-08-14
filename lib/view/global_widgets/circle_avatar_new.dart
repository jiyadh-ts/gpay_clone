import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class profileswidgetNew extends StatelessWidget {
  const profileswidgetNew({
    this.title,
    super.key,
    this.list,
    this.isvisible = false,
    this.secondaryImageVisible = false,
  });
  final title;
  final list;
  final bool isvisible;
  final bool secondaryImageVisible;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorConstraints.mainblack,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isvisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 27,
                    child: Icon(
                      Icons.group_add_outlined,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Group",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "start group chat or split an expenses",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                final chat = list[index];
                return Container(
                  padding: EdgeInsets.all(5),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(chat["image"]),
                      ),
                      SizedBox(width: 15),
                      Text(
                        chat["name"],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: list.length,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
