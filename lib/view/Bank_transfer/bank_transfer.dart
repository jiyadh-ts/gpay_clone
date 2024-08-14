import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class BankTransfer extends StatefulWidget {
  const BankTransfer({super.key});

  @override
  State<BankTransfer> createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  bool _isButtonEnabled = false;

  void _checkIfFieldsAreFilled() {
    setState(() {
      _isButtonEnabled = _accountNumberController.text.isNotEmpty && _ifscCodeController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _accountNumberController.addListener(_checkIfFieldsAreFilled);
    _ifscCodeController.addListener(_checkIfFieldsAreFilled);
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    _ifscCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Icon(Icons.more_vert, size: 20),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter recipient details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstraints.Mainblue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstraints.lightgrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstraints.Mainblue,
                  ),
                ),
                labelText: "Bank Account number",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _ifscCodeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstraints.Mainblue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstraints.lightgrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstraints.Mainblue,
                  ),
                ),
                labelText: "IFSC Code",
                prefixText: "IFSC Code ",
                prefixStyle: TextStyle(color: ColorConstraints.lightgrey),
                suffixText: "Search for IFSC Code",
                suffixStyle: TextStyle(color: ColorConstraints.Mainblue),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: _isButtonEnabled ? () {
                // Perform action when button is enabled and pressed
              } : null,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isButtonEnabled ? ColorConstraints.Mainblue : Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Column(
                children: [
                  Text(
                    "This information will be securely saved as per Google Pay",
                    style: TextStyle(color: ColorConstraints.lightgrey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Terms of service and privacy Policy",
                    style: TextStyle(color: ColorConstraints.lightgrey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(
              "Enter recipient details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 47,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstraints.lightgrey
                        ),
                        child: CircleAvatar(
                          radius: 42,
                          child: Icon(Icons.account_balance,size: 24,color: ColorConstraints.lightblue,),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "Recent bank transfers will show up here",  style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500,
                                color: Colors.grey
                                ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "for you to easily repeat them",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
          
          ],
        ),
      ),
    );
  }
}
