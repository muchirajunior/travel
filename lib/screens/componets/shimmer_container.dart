import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: const Card(
        child:  Center(
          child:  Text(
            'Loading ..',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight:
              FontWeight.bold,
              color: Colors.grey
            ),
          ),
        ),
      ),
    );
  }
}