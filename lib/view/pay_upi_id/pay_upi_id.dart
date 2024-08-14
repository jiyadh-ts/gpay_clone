import 'package:flutter/material.dart';
import 'package:gpay_clone/view/util/colorconstraints.dart';

class PayUpiId extends StatefulWidget {
  const PayUpiId({super.key});

  @override
  State<PayUpiId> createState() => _PayUpiIdState();
}

class _PayUpiIdState extends State<PayUpiId> {
    final TextEditingController _accountNumberController = TextEditingController();
      bool _isButtonEnabled = false;
void _checkIfFieldsAreFilled() {
    setState(() {
      _isButtonEnabled = _accountNumberController.text.isNotEmpty;
    });
  }

  void initState() {
    super.initState();
    _accountNumberController.addListener(_checkIfFieldsAreFilled);
  }

    void dispose() {
    _accountNumberController.dispose();
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
              "Enter UPI ID or number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5,),
             Row(
                children: [
                  Text(
                    "Pay any",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstraints.lightgrey),
                  ),
                  Text(
                    " UPI",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorConstraints.mainblack,
                        fontVariations: [
                          FontVariation('slnt', 40.0), // Adjust the angle as needed
                        ],
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    " app using phone number",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: ColorConstraints.lightgrey),
                  ),
                ],
              ),
              SizedBox(height:30),
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
                labelText: "UPI ID or number",
              ),
              keyboardType: TextInputType.number,
            ),
            Spacer(),
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
          ],
        ),
      )
      
    );
  }
}