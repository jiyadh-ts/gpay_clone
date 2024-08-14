import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class GPayRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool showSubtitle;
  final String subtitle;
  final Widget? trailingWidget;

  const GPayRow({
    Key? key,
    required this.icon,
    required this.title,
    this.showSubtitle = false,
    this.subtitle = '',
    this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: ColorConstraints.Mainblue),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: ColorConstraints.mainblack,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showSubtitle) ...[
                SizedBox(height: 2),
                Container(
                  height: 15,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorConstraints.lightgreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      subtitle,
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
              ],
            ],
          ),
          Spacer(),
          trailingWidget ?? 
          Text(
            'Apply now',
            style: TextStyle(fontSize: 16, color: ColorConstraints.Mainblue),
          ),
        ],
      ),
    );
  }
}
