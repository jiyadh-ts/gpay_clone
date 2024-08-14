import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class CustomIconAvatarList extends StatelessWidget {
  final String title;
  final bool showSubtitle;
  final String subtitle;
  final bool isVisible;

  static const List<Map<String, dynamic>> iconItems = [
    {
      'icon': Icons.book_online,
      'title': 'Mobile',
      'subtitle': 'recharge',
      'route': '/mobileRecharge',
    },
    {
      'icon': Icons.tv_outlined,
      'title': 'DTH/Cable',
      'subtitle': 'TV',
      'route': '/dthRecharge',
    },
    {
      'icon': Icons.emoji_objects_outlined,
      'title': 'Electricity',
      'subtitle': 'Bill',
      'route': '/electricityBill',
    },
    {
      'icon': Icons.minor_crash_outlined,
      'title': 'FastTag',
      'subtitle': 'recharge',
      'route': '/fastTagRecharge',
    },
  ];

  const CustomIconAvatarList({
    Key? key,
    required this.title,
    this.showSubtitle = false,
    this.subtitle = "",
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 26.75,
                    fontWeight: FontWeight.w500,
                    color: ColorConstraints.mainblack,
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: isVisible,
                  child: Row(
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstraints.Mainblue,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: ColorConstraints.Mainblue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: showSubtitle,
              child: Text(subtitle, style: TextStyle(fontSize: 14)),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: iconItems
                  .map((item) => _buildIconAvatar(context, item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconAvatar(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, item['route']);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: ColorConstraints.lightblue,
            child: Icon(
              item['icon'],
              size: 30,
              color: ColorConstraints.mainblack,
            ),
          ),
          SizedBox(height: 5),
          Text(
            item['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (item['subtitle'] != null && item['subtitle'].isNotEmpty)
            Text(
              item['subtitle'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
