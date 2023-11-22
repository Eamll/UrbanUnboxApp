import 'package:flutter/material.dart';

class Businesses extends StatelessWidget {
  const Businesses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: 6, // Replace with your actual business count
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
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
                return BusinessContainer();
              }
            },
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
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 4,
            image: AssetImage(
              'assets/images/logo.png',
            ),
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.8),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Business Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
