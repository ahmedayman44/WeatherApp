import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'searching now 🔍',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
