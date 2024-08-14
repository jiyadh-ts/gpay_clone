import 'package:flutter/material.dart';
import 'package:gpay_clone/view/Balance_upi_pin/balance_upi_pin_page.dart';
import 'package:gpay_clone/view/Bank_transfer/bank_transfer.dart';
import 'package:gpay_clone/view/CIBIL/cibil_score.dart';
import 'package:gpay_clone/view/Mobile_Recharge/mobile_recharge.dart';
import 'package:gpay_clone/view/SEE_TRANSACTION/see_transaction.dart';
import 'package:gpay_clone/view/Self_Transfer/self_transfer.dart';
import 'package:gpay_clone/view/dummydb.dart';
import 'package:gpay_clone/view/global_widgets/circleIconavatar.dart';
import 'package:gpay_clone/view/global_widgets/circleavatar_profile.dart';
import 'package:gpay_clone/view/global_widgets/gpayrow.dart';
import 'package:gpay_clone/view/pay_bills/pay_bills.dart';
import 'package:gpay_clone/view/pay_contacts/pay_contacts.dart';
import 'package:gpay_clone/view/pay_phonenumber/pay_phonenumber.dart';
import 'package:gpay_clone/view/pay_upi_id/pay_upi_id.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';
import 'package:gpay_clone/view/util/imageconstaints.dart';
import 'dart:async';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> hintTexts = [
    'Pay anyone on UPI',
    'Pay Friends and Merchants',
    'Pay by Name or Phone number',
  ];
  int _currentHintIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentHintIndex = (_currentHintIndex + 1) % hintTexts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTopSection(),
            _buildMenuSection(),
            SizedBox(height: 10),
            _buildIdSection(),
            SizedBox(height: 30),
            CustomAvatarList(
              title: "People",
              people: Dummydb.people,
              isCircle: true,
              showSubtitle: false,
            ),
            CustomAvatarList(
              title: "Businesses",
              people: Dummydb.businessList,
              isVisible: true,
            ),
            CustomIconAvatarList(
              title: "Bills & Recharges",
              showSubtitle: true,
              subtitle: "No bills due, Try adding them",
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PayBills()));
              },
              child: Container(
                height: 42,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ColorConstraints.mainblack),
                ),
                child: Center(
                  child: Text(
                    "View all",
                    style: TextStyle(
                        color: ColorConstraints.Mainblue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomAvatarList(
              title: "Offers & Rewards",
              people: Dummydb.offerlist,
              isCircle: true,
              showSubtitle: false,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Manage your money",
                  style: TextStyle(
                    fontSize: 26.75,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GPayRow(
              icon: Icons.credit_card_outlined,
              title: "Get a credit card",
              showSubtitle: true,
              subtitle: "₹0 joining fee",
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CibilScore()));
              },
              child: GPayRow(
                icon: Icons.speed_outlined,
                title: "Check your CIBIL score for free",
                showSubtitle: false,
                trailingWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstraints.mainblack,
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SeeTransaction()));
              },
              child: GPayRow(
                icon: Icons.history,
                title: "See transaction history",
                showSubtitle: false,
                trailingWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstraints.mainblack,
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BalanceUpiPage()));
              },
              child: GPayRow(
                icon: Icons.account_balance_outlined,
                title: "Check bank balance",
                showSubtitle: false,
                trailingWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstraints.mainblack,
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  ClipPath _buildBottomSection() {
    return ClipPath(
            clipper: WavyClipper(),
            child: Container(
              height:
                  280, 
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  color:
                      Colors.white,
                ),
                child: ClipPath(
                  clipper: WavyClipper(),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter, // Adjust as needed
                        image: NetworkImage(
                          "https://th.bing.com/th/id/R.be098ee02ed4e0fd2a6e84f0aae2e017?rik=eq3LP8VTI71Dfw&riu=http%3a%2f%2fwww.mute.nl%2fthemutezone%2fwp-content%2fuploads%2f2020%2f07%2fanimation04-960x540.jpg&ehk=2gA7jv14hqN9uZTRjX%2bGUahFAmVlnSzypnJP%2btIGSvk%3d&risl=&pid=ImgRaw&r=0",
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Invite friends to get ₹201",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorConstraints.mainbwhite),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Invite friends to Google pay and get ₹201 when your\nfriend sends their first payment .They get ₹21!",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorConstraints.mainbwhite),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Copy your code ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstraints.mainbwhite),
                              ),
                              Text("v87u27w   ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstraints.mainbwhite)),
                              Icon(
                                Icons.content_copy,
                                color: ColorConstraints.mainbwhite,
                                size: 14,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 42,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: ColorConstraints.mainblack),
                            ),
                            child: Center(
                              child: Text(
                                "view all",
                                style: TextStyle(
                                    color: ColorConstraints.Mainblue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Row _buildIdSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Active UPI Lite ", style: TextStyle(fontSize: 12)),
              SizedBox(width: 5),
              Icon(Icons.add_circle, size: 16),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(4),
          height: 38,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "UPI ID:jiyadh1111@oksbi",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildMenuSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconButton(
                Icons.qr_code_scanner,
                "Scan any",
                "QR code",
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("please Connect to Internet"),
        ),);
                },
              ),
              _buildIconButton(
                Icons.library_books,
                "Pay",
                "contacts",
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayContacts()));
                },
              ),
              _buildIconButton(
                Icons.send_to_mobile,
                "Pay phone",
                "number",
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PayPhonenumber()));
                },
              ),
              _buildIconButton(
                Icons.account_balance,
                "Bank",
                "transfer",
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BankTransfer()));
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconButton(
                Icons.payments_rounded,
                "Pay UPI ID",
                "or number",
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayUpiId()));
                },
              ),
              _buildIconButton(
                Icons.camera_front,
                "Self",
                "transfer",
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelfTransfer()));
                  // Add your navigation code here
                },
              ),
              _buildIconButton(
                Icons.receipt_long,
                "Pay",
                "Bills",
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayBills()));
                  // Add your navigation code here
                },
              ),
              _buildIconButton(
                Icons.book_online,
                "Mobile",
                "Recharge",
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MobileRecharge()));
                 
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack _buildTopSection() {
    return Stack(
      children: [
        Container(
          height: 246,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Imageconstaints.Image1),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 16,
          right: 16,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: hintTexts[_currentHintIndex],
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(
      IconData icon, String title, String subtitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30, color: ColorConstraints.Mainblue),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0); // Start point

    // Define 13 small humps along the width
    double waveCount = 13;
    double waveWidth = size.width / waveCount;
    double waveHeight = 10.0; // Height of the humps

    for (double i = 0; i < size.width; i += waveWidth) {
      path.quadraticBezierTo(
        i + waveWidth / 4, -waveHeight, // Control point above the baseline
        i + waveWidth / 2, 0.0, // End point at baseline
      );
      path.quadraticBezierTo(
        i + 3 * waveWidth / 4, waveHeight, // Control point below the baseline
        i + waveWidth, 0.0, // End point at baseline
      );
    }

    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
