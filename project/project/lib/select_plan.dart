import 'package:flutter/material.dart';

import 'payment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlanSelectionPage(),
    );
  }
}

class PlanSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose your plan!',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 23.0),
              PlanCard(
                title: '1 Month',
                price: '\$12.00 /mt',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        title: '1 Month',
                        price: '12.00\$',
                      ),
                    ),
                  );
                },
              ),
              PlanCard(
                title: '3 Months',
                price: '\$9.00 /mt',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        title: '3 Months',
                        price: '9.00\$',
                      ),
                    ),
                  );
                },
              ),
              PlanCard(
                title: ' 12 Months  ',
                price: '\$6.00 /mt',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        title: '12 Months ',
                        price: '6.00\$',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final VoidCallback onPressed;

  PlanCard({required this.title, required this.price, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              price,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Click'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
