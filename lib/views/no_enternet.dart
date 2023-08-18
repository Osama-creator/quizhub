import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/noconnection.png', // Replace with your image asset path
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please check your network settings and try again.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement a function to retry connecting to the internet
              },
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
