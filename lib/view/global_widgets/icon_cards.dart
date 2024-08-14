import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class IconCards extends StatelessWidget {
  const IconCards({super.key, required this.title, required this.items});

  final String title;
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 26.75,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 12),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              
                border: Border(
                  left: BorderSide(color: Colors.grey.shade300),
                  right: BorderSide(color: Colors.grey.shade300),
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], color: ColorConstraints.Mainblue, size: 30),
                    SizedBox(height: 5),
                    if (item['name'].contains(' '))
                      Column(
                        children: [
                          Text(
                            item['name'].split(' ')[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstraints.mainblack,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item['name'].substring(item['name'].indexOf(' ') + 1),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstraints.mainblack,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    else
                      Text(
                        item['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstraints.mainblack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
