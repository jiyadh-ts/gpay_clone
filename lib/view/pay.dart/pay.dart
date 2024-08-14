import 'package:flutter/material.dart';
import 'package:gpay_clone/view/UPI_PIN%20_PAGE/upi_pin_page.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class Pay extends StatefulWidget {
  const Pay({super.key, required this.person});

  final Map<String, dynamic> person;

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  final TextEditingController amountController = TextEditingController();
  bool _isBottomContainerVisible = false;

  void _toggleBottomContainer() {
    setState(() {
      _isBottomContainerVisible = !_isBottomContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ),
        actions: [
          Icon(Icons.report),
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the content vertically
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: widget.person['image'] != null
                    ? NetworkImage(widget.person['image'])
                    : null,
                child: widget.person['image'] == null
                    ? Text(
                        widget.person['name'][0],
                        style: TextStyle(
                          fontSize: 25,
                          color: ColorConstraints.mainbwhite,
                        ),
                      )
                    : null,
              ),
              SizedBox(height: 10),
              Text(
                'Paying ${widget.person['name']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Banking Name: ${widget.person['name']}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                '${widget.person['phoneNumber']}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorConstraints.lightgrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          width: 100,
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 1),
                                child: Text(
                                  '₹',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              hintText: '0',
                              hintStyle: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: ColorConstraints.mainblack,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.5),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          width: 110,
                          decoration: BoxDecoration(
                            color: ColorConstraints.lightgrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: ' Add a note ',
                                filled: true,
                                fillColor: ColorConstraints.lightgrey,
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isBottomContainerVisible)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose your account to pay with',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: 65,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorConstraints.lightgrey),
                              borderRadius: BorderRadius.circular(5)),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                "https://th.bing.com/th/id/OIP.SALp5MP-n4R837zjAQlniwHaHa?w=144&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "State Bank of India****3271",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  "Balance: ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstraints.lightgrey),
                                ),
                                Text(
                                  " Check now",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstraints.Mainblue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double
                          .infinity, 
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpiPinPage(
                            recipientName: widget.person['name'],
                            amount:amountController.text ,
                          )));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: ColorConstraints.Mainblue,
                        ),
                        child: Text(
                          'Pay ₹${amountController.text}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: _isBottomContainerVisible
          ? null
          : FloatingActionButton(
              onPressed: _toggleBottomContainer,
              backgroundColor: ColorConstraints.Mainblue,
              child: Icon(
                Icons.arrow_forward,
                color: ColorConstraints.mainbwhite,
              ),
            ),
    );
  }
}
