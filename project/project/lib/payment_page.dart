import 'package:flutter/material.dart';

import 'HomePage.dart';

typedef VoidCallback = void Function();

class PaymentPage extends StatefulWidget {
  final String title;
  final String price;

  PaymentPage({required this.title, required this.price});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedOption = '';
  TextEditingController cvcController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  @override
  void dispose() {
    cvcController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
          backgroundColor: Color.fromARGB(255, 18, 19, 102),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Color.fromARGB(255, 9, 11, 77),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 36.0), //20
              Text(
                'Total : ${widget.price}',
                style: TextStyle(fontSize: 20.0), //18
              ),
              SizedBox(height: 30.0), //10
              PaymentOption(
                title: 'PayPal',
                onPressed: () {
                  setState(() {
                    selectedOption = 'PayPal';
                  });
                },
                isSelected: selectedOption == 'PayPal',
              ),
              PaymentOption(
                title: 'Apple Pay',
                onPressed: () {
                  setState(() {
                    selectedOption = 'Apple Pay';
                  });
                },
                isSelected: selectedOption == 'Apple Pay',
              ),
              PaymentOption(
                title: 'Credit Card',
                onPressed: () {
                  setState(() {
                    selectedOption = 'Credit Card';
                  });
                },
                isSelected: selectedOption == 'Credit Card',
              ),
              SizedBox(height: 20.0),
              if (selectedOption == 'Credit Card') ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Card Number ',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: expiryDateController,
                          decoration: InputDecoration(
                            labelText: 'MM/YY',
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          controller: cvcController,
                          decoration: InputDecoration(
                            labelText: 'CVC',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Done!'),
                      content: Text('Payment completed ${widget.price} by $selectedOption'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // This closes the dialog
                            
                            // Now navigate to the HomePage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          child: Text('ok'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('pay'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 19, 102),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  PaymentOption({
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Radio(
        value: isSelected,
        groupValue: true,
        onChanged: (value) => onPressed(),
      ),
    );
  }
}
