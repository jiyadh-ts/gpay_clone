import 'package:flutter/material.dart';
import 'package:gpay_clone/view/personDetailsPage/persondetails.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class CustomAvatarList extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> people;
  final bool isCircle;
  final bool showSubtitle;
  final bool isVisible;

  const CustomAvatarList({
    Key? key,
    required this.title,
    required this.people,
    this.isCircle = false,
    this.showSubtitle = false,  
    this.isVisible = false,
  }) : super(key: key);

  @override
  _CustomAvatarListState createState() => _CustomAvatarListState();
}

class _CustomAvatarListState extends State<CustomAvatarList> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final int maxItemsToShow = 8;
    final bool showMoreButton = widget.people.length > maxItemsToShow && !_showMore;
    final int itemCount = _showMore
        ? widget.people.length + 1
        : (showMoreButton ? maxItemsToShow : widget.people.length);

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
                  widget.title,
                  style: TextStyle(
                    fontSize: 26.75,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: widget.isVisible,
                  child: Row(
                    children: [
                      Text("Explore", style: TextStyle(fontSize: 16, color: ColorConstraints.Mainblue)),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, size: 18, color: ColorConstraints.Mainblue),
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
              visible: widget.showSubtitle,
              child: Text("No bills due. Try adding these!", style: TextStyle(fontSize: 14)),
            ),
          ),
          SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              if (!_showMore && showMoreButton && index == maxItemsToShow - 1) {
                return _buildShowMoreButton(context);
              } else if (_showMore && index == widget.people.length) {
                return _buildShowLessButton(context);
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonDetailPage(person: widget.people[index]),
                    ),
                  );
                },
                child: _buildAvatarItem(context, widget.people[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarItem(BuildContext context, Map<String, dynamic> person) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: person['image'] != null
                  ? NetworkImage(person['image'])
                  : null,
              child: person['image'] == null
                  ? Text(
                      person['name'][0],
                      style: TextStyle(fontSize: 24, color: ColorConstraints.mainbwhite),
                    )
                  : null,
            ),
            if (person['isActive'] == true)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          person['name'],
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildShowMoreButton(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _showMore = true;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            child: Icon(Icons.keyboard_arrow_down,color: ColorConstraints.mainblack,),
          ),
          SizedBox(height: 5),
          Text(
            "Show More",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildShowLessButton(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _showMore = false;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            child: Icon(Icons.keyboard_arrow_up,color: ColorConstraints.Mainblue,),
          ),
          SizedBox(height: 5),
          Text(
            "Show Less",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

