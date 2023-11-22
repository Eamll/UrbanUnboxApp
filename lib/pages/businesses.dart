import 'package:flutter/material.dart';

class Businesses extends StatelessWidget {
  const Businesses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/logo.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 3, // Replace with your actual business count
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  // Display two businesses in the same row
                  return Row(
                    children: [
                      Expanded(
                        child: BusinessContainer(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: BusinessContainer(),
                      ),
                    ],
                  );
                } else {
                  // Display a single business in a row
                  return BusinessContainer();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BusinessContainer extends StatelessWidget {
  const BusinessContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit
                .contain, // Adjust the fit property as per your requirement
            alignment: Alignment.center),
      ),
      height: 200,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Center(
          child: Text(
            'Business Name', // Replace with your business name
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
